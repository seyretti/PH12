import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gelir_gider_uygulamasi/core/app_bindings.dart';
import 'package:gelir_gider_uygulamasi/routes/app_pages.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';
import 'package:gelir_gider_uygulamasi/services/storage_service.dart';
import 'package:gelir_gider_uygulamasi/themes/app_theme.dart';
import 'package:gelir_gider_uygulamasi/services/supabase_service.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', null);
  await Supabase.initialize(
    url: 'https://lnsnxqnnfzjetcwmcpgl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxuc254cW5uZnpqZXRjd21jcGdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjY5OTk4ODcsImV4cCI6MjA4MjU3NTg4N30._MpN9q0pDV_-5treieesGEq6YlWadVpe28SLAKqBU7s',
  );

  await Get.putAsync(() => StorageService().init());
  Get.put(SupabaseService());
  await Get.putAsync(() => DBService().init());
  await Get.putAsync(() => AuthService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NetBakiye - Gelir Gider Takibi',
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      initialBinding: AppBindings(),
      locale: const Locale('tr', 'TR'),
      fallbackLocale: const Locale('tr', 'TR'),
      supportedLocales: const [
        Locale('tr', 'TR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
