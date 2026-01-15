import 'package:gelir_gider_uygulamasi/core/base_controller.dart';
import 'package:gelir_gider_uygulamasi/routes/app_pages.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';
import 'package:gelir_gider_uygulamasi/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    super.onReady();
    await waitForServices();
    await checkTokenAndRedirect();
  }

  Future<void> waitForServices() async {
    while (!Get.isRegistered<StorageService>() ||
        !Get.isRegistered<AuthService>()) {
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future<void> checkTokenAndRedirect() async {
    final AuthService _authService = Get.find<AuthService>();
    final isAuthenticated = await _authService.isAuthenticated();
    if (isAuthenticated) {
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }
}
