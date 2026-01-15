import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:gelir_gider_uygulamasi/core/base_controller.dart';
import 'package:gelir_gider_uygulamasi/routes/app_pages.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';
import 'package:gelir_gider_uygulamasi/modules/home/home_controller.dart';

class LoginController extends BaseController {
  late final AuthService _authService;
  late final DBService _dbService;

  // SupabaseService'i buradan sildik çünkü DBService hallediyor.

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final registerNameController = TextEditingController();
  final registerSurnameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final isRememberMe = false.obs;
  final isPasswordHidden = true.obs;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.find<AuthService>();
    _dbService = Get.find<DBService>();
  }

  // --- GOOGLE GİRİŞİ ---
  Future<void> googleIleGirisYap() async {
    if (isLoading.value) return;
    try {
      setLoading(true);
      final appUser = await _authService.signInWithGoogle();

      if (appUser != null) {
        await _misafirVerileriniYonet(appUser.id);
      } else {
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      showErrorSnackbar(message: "Google girişi başarısız: $e");
    }
  }

  // --- EMAIL GİRİŞİ ---
  Future<void> emailIleGirisYap() async {
    if (isLoading.value) return;
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      showErrorSnackbar(message: "Lütfen tüm alanları doldurun");
      return;
    }
    try {
      setLoading(true);
      await _authService.signInWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      final currentUser = _authService.currentUser.value;

      if (currentUser != null) {
        await _misafirVerileriniYonet(currentUser.id);
      } else {
        setLoading(false);
        showErrorSnackbar(message: "Kullanıcı bilgisi alınamadı.");
      }
    } on AuthException catch (e) {
      setLoading(false);
      showErrorSnackbar(message: _hataMesajiniTurkcelestir(e.message));
    } catch (e) {
      setLoading(false);
      showErrorSnackbar(message: "Giriş yapılamadı: $e");
    }
  }

  // --- KAYIT OL ---
  Future<void> kayitOl() async {
    if (isLoading.value) return;
    if (registerNameController.text.isEmpty ||
        registerSurnameController.text.isEmpty ||
        registerEmailController.text.isEmpty ||
        registerPasswordController.text.isEmpty) {
      showErrorSnackbar(message: "Lütfen tüm alanları doldurun");
      return;
    }
    try {
      setLoading(true);
      await _authService.signUpWithEmail(
        email: registerEmailController.text.trim(),
        password: registerPasswordController.text,
        name: registerNameController.text.trim(),
        surname: registerSurnameController.text.trim(),
      );
      final currentUser = _authService.currentUser.value;

      if (currentUser != null) {
        await _misafirVerileriniYonet(currentUser.id);
      } else {
        setLoading(false);
        showErrorSnackbar(message: "Kayıt olundu fakat oturum açılamadı.");
      }
    } on AuthException catch (e) {
      setLoading(false);
      showErrorSnackbar(message: _hataMesajiniTurkcelestir(e.message));
    } catch (e) {
      setLoading(false);
      showErrorSnackbar(message: "Bir sorun oluştu: $e");
    }
  }

  // --- MİSAFİR YÖNETİMİ ---
  Future<void> _misafirVerileriniYonet(String userId) async {
    try {
      final misafirIslemleri = await _dbService.getMisafirIslemleri();

      if (misafirIslemleri.isEmpty) {
        _anasayfayaGit();
      } else {
        setLoading(false);

        await Get.dialog(
          AlertDialog(
            title: const Text("Veriler Birleştirilsin mi?"),
            content: const Text(
                "Misafir modundaki verilerinizi hesabınıza aktarmak ister misiniz?"),
            actions: [
              TextButton(
                onPressed: () async {
                  Get.back();
                  setLoading(true);
                  await _dbService.misafirVerileriniSil();
                  _anasayfayaGit();
                },
                child: const Text("Hayır, Sil",
                    style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700),
                onPressed: () async {
                  Get.back();
                  setLoading(true);
                  // Hızlı devretme işlemi
                  await _dbService.misafirVerileriniKullaniciyaAta(userId);
                  _anasayfayaGit();
                },
                child: const Text("Evet, Birleştir",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          barrierDismissible: false,
        );
      }
    } catch (e) {
      setLoading(false);
      showErrorSnackbar(message: "Yönetim hatası: $e");
    }
  }

  void _anasayfayaGit() {
    setLoading(false);

    if (Get.isRegistered<HomeController>()) {
      final homeCtrl = Get.find<HomeController>();
      homeCtrl.changePage(0);
      homeCtrl.verileriYenile(); // Senkronizasyon burada başlar
    }

    Get.offAllNamed(AppRoutes.HOME);

    Get.snackbar(
      "Hoşgeldiniz",
      "Oturum açıldı.",
      backgroundColor: Colors.green.shade700,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 2),
    );
  }

  String _hataMesajiniTurkcelestir(String ingilizceMesaj) {
    if (ingilizceMesaj.contains("Invalid login credentials")) {
      return "E-posta adresi veya şifre hatalı.";
    }
    if (ingilizceMesaj.contains("User already registered")) {
      return "Bu e-posta adresiyle zaten bir kayıt var.";
    }
    if (ingilizceMesaj.contains("Password should be at least")) {
      return "Şifreniz en az 6 karakter olmalıdır.";
    }
    if (ingilizceMesaj.contains("Email not confirmed")) {
      return "Lütfen e-posta adresinizi onaylayın.";
    }
    return ingilizceMesaj;
  }
}
