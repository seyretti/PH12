import 'package:gelir_gider_uygulamasi/models/app_user.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';
import 'package:gelir_gider_uygulamasi/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  late final StorageService _storageService;
  late final GoogleSignIn _googleSignIn;
  final SupabaseClient _supabase = Supabase.instance.client;
  static const String serverClientId =
      "651528128656-19npc5u71oufkv91avg61urmcrg9o5jp.apps.googleusercontent.com";

  final Rx<AppUser?> currentUser = Rx<AppUser?>(null);

  Future<AuthResponse?> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String surname,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': '$name $surname',
          'first_name': name,
          'last_name': surname,
        },
      );
      if (response.user != null) {
        _checkCurrentUser();
      }

      return response;
    } catch (e) {
      print("Kayıt Hatası: $e");
      rethrow;
    }
  }

  Future<AuthResponse?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        _checkCurrentUser();
      }
      return response;
    } catch (e) {
      print("Email Giriş Hatası: $e");
      rethrow;
    }
  }

  Future<AuthService> init() async {
    _storageService = Get.find<StorageService>();

    _googleSignIn = GoogleSignIn(
      serverClientId: serverClientId,
      scopes: ['email', 'profile'],
    );

    _checkCurrentUser();
    return this;
  }

  Future<AppUser?> signInWithGoogle() async {
    try {
      print("Google girişi başlıyor...");

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        throw 'Google ID Token bulunamadı';
      }

      print("Google Token alındı, Supabase'e gönderiliyor...");

      final AuthResponse response = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      final User? user = response.user;

      if (user != null) {
        final session = response.session;
        if (session != null) {
          await _storageService.setValue<String>(
            StorageKeys.userToken,
            session.accessToken,
          );
        }

        final appUser = _mapSupabaseUserToAppUser(user);
        currentUser.value = appUser;
        return appUser;
      } else {
        print("❌ Supabase kullanıcısı oluşturulamadı.");
        return null;
      }
    } catch (e) {
      print("Google Sign In Hatası: $e");
      Get.snackbar("Hata", "Giriş yapılırken bir sorun oluştu: $e");
      currentUser.value = null;
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      if (Get.isRegistered<DBService>()) {
        await Get.find<DBService>().kullaniciVerileriniTemizle();
      }
      await _googleSignIn.signOut();
      await _supabase.auth.signOut();
      await _storageService.remove(StorageKeys.userToken);
      currentUser.value = null;
    } catch (e) {
      print("Çıkış hatası: $e");
    }
  }

  void _checkCurrentUser() {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      currentUser.value = _mapSupabaseUserToAppUser(user);
      print("👤 Mevcut Kullanıcı: ${user.email}");
    } else {
      currentUser.value = null;
    }
  }

  AppUser _mapSupabaseUserToAppUser(User user) {
    final metadata = user.userMetadata;

    return AppUser(
      id: user.id,
      email: user.email ?? "",
      firstName: metadata?['full_name']?.split(' ').first ?? "Kullanıcı",
      lastName: metadata?['full_name']?.split(' ').last ?? "",
      profilePhoto: metadata?['avatar_url'] ?? metadata?['picture'],
    );
  }

  Future<bool> isAuthenticated() async {
    final session = _supabase.auth.currentSession;
    if (session != null && !session.isExpired) {
      _checkCurrentUser();
      return true;
    }
    return false;
  }
}
