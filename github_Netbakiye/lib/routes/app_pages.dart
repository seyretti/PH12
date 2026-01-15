import 'package:gelir_gider_uygulamasi/modules/transaction/transaction_page.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/modules/home/home_bindings.dart';
import 'package:gelir_gider_uygulamasi/modules/home/home_page.dart';
import 'package:gelir_gider_uygulamasi/modules/login/login_bindings.dart';
import 'package:gelir_gider_uygulamasi/modules/login/login_page.dart';
import 'package:gelir_gider_uygulamasi/modules/splash/splash_bindings.dart';
import 'package:gelir_gider_uygulamasi/modules/splash/splash_page.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/transaction_bindings.dart';

abstract class AppRoutes {
  static const INITIAL = SPLASH;
  static const SPLASH = "/splash";
  static const LOGIN = "/login";
  static const HOME = "/home";
  static const PROFILE = "/profil";
  static const TRANSACTION = "/transaction";
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.TRANSACTION,
      page: () => const TransactionPage(),
      binding: TransactionBindings(),
    ),
  ];
}
