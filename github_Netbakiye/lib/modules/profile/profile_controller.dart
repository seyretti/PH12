import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';
import 'package:gelir_gider_uygulamasi/services/theme_service.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';
import 'package:gelir_gider_uygulamasi/services/supabase_service.dart';
import 'package:gelir_gider_uygulamasi/routes/app_pages.dart';
import 'package:gelir_gider_uygulamasi/models/app_user.dart';
import 'package:gelir_gider_uygulamasi/modules/home/home_controller.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final DBService _dbService = Get.find<DBService>();
  final SupabaseService _supabaseService = Get.find<SupabaseService>();

  Rx<AppUser?> get user => _authService.currentUser;

  // Misafir
  bool get isGuest => user.value == null;
  ThemeService get themeService {
    try {
      return Get.find<ThemeService>();
    } catch (e) {
      return Get.put(ThemeService());
    }
  }

  void goToLogin() {
    Get.toNamed(AppRoutes.LOGIN);
  }

  //HESABI SİLME
  Future<void> deleteAccount() async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      final userId = user.value?.id;

      if (userId != null) {
        await _supabaseService.kullaniciVerileriniBuluttanSil(userId);
      }
      await _dbService.kullaniciVerileriniTemizle();
      await _authService.signOut();
      if (Get.isDialogOpen ?? false) Get.back();
      Get.offAllNamed(AppRoutes.HOME);
      if (Get.isRegistered<HomeController>()) {
        final homeCtrl = Get.find<HomeController>();
        homeCtrl.changePage(0);
        homeCtrl.verileriYenile();
      }

      Get.snackbar(
        "Hesap Silindi",
        "Tüm verileriniz ve hesabınız kalıcı olarak silindi.",
        backgroundColor: Colors.grey[800],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();

      Get.snackbar(
        "Hata",
        "Silme işlemi sırasında bir sorun oluştu: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
