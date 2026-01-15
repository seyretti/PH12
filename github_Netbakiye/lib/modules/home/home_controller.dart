import 'dart:async'; // StreamSubscription için gerekli
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import 'package:gelir_gider_uygulamasi/core/base_controller.dart';
import 'package:gelir_gider_uygulamasi/routes/app_pages.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';
import 'package:gelir_gider_uygulamasi/models/gelir_gider.dart';

import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/category_controller.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';

class HomeController extends BaseController {
  final currentIndex = 0.obs;

  final AuthService _authService = Get.find<AuthService>();
  final DBService _dbService = Get.find<DBService>();

  // Stream'i kontrol etmek için değişken
  StreamSubscription? _islemSubscription;

  bool get isGuest => _authService.currentUser.value == null;

  void changePage(int index) {
    currentIndex.value = index;
    if (index == 0) {
      verileriYenile();
    }
  }

  // --- GÜVENLİ ÇIKIŞ YAP ---
  Future<void> cikisYap() async {
    // 1. Önce canlı veri akışını DURDUR (Hayalet veri görünmemesi için şart!)
    await _islemSubscription?.cancel();
    _islemSubscription = null;

    // 2. Veritabanını temizle
    await _dbService.kullaniciVerileriniTemizle();

    // 3. UI listesini boşalt
    islemler.clear();
    toplamGelir.value = 0;
    toplamGider.value = 0;
    netBakiye.value = 0;

    // 4. Oturumu kapat
    await _authService.signOut();

    // 5. Diğer controller'ları temizle
    try {
      if (Get.isRegistered<CategoryController>()) {
        Get.delete<CategoryController>(force: true);
      }
      if (Get.isRegistered<TransactionController>()) {
        Get.delete<TransactionController>(force: true);
      }
    } catch (e) {
      print("Controller silme: $e");
    }

    currentIndex.value = 0;

    // 6. Misafir modunu başlat (Stream yeniden kurulacak)
    await verileriYenile();

    Get.offAllNamed(AppRoutes.HOME);

    Get.snackbar(
      "Oturum Kapatıldı",
      "Misafir moduna geçildi.",
      backgroundColor: Colors.grey[800],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void goToLogin() {
    Get.toNamed(AppRoutes.LOGIN);
  }

  void goToTransaction() {
    Get.toNamed(AppRoutes.TRANSACTION)?.then((value) {
      verileriYenile();
    });
  }

  final RxList<Islem> islemler = <Islem>[].obs;
  final RxDouble toplamGelir = 0.0.obs;
  final RxDouble toplamGider = 0.0.obs;
  final RxDouble netBakiye = 0.0.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    verileriYenile(); // İlk açılışta verileri çek
  }

  @override
  void onClose() {
    _islemSubscription?.cancel(); // Controller kapanırken stream'i kapat
    super.onClose();
  }

  Future<void> verileriYenile() async {
    isLoading.value = true;

    // Eski stream varsa kapat (üst üste binmemesi için)
    await _islemSubscription?.cancel();

    try {
      final user = _authService.currentUser.value;

      // Senkronizasyon (Sadece kullanıcı varsa)
      if (user != null) {
        // await koymuyoruz ki UI donmasın, arkada çalışsın
        _dbService.butunVerileriSenkronizeEt(user.id);
      }

      // Stream'i yeniden başlat (Doğru kullanıcıya veya misafire göre)
      _verileriDinle(user?.id);
    } catch (e) {
      print("Veri çekme hatası: $e");
      isLoading.value = false;
    }
  }

  // Dinleyici artık ID parametresi alıyor
  void _verileriDinle(String? userId) {
    QueryBuilder<Islem, Islem, QAfterFilterCondition> query;

    if (userId != null) {
      query = _dbService.isar.islems.filter().userIdEqualTo(userId);
    } else {
      query = _dbService.isar.islems.filter().userIdIsNull();
    }

    // Stream başlatılıyor
    _islemSubscription = query
        .sortByTarihDesc()
        .watch(fireImmediately: true) // True yaptık ki hemen veri gelsin
        .listen((yeniListe) {
      islemler.assignAll(yeniListe);
      _toplamlariHesapla();
      isLoading.value = false;
    });
  }

  void _toplamlariHesapla() {
    double gelir = 0;
    double gider = 0;

    for (var item in islemler) {
      if (item.isExcluded == true) continue;

      if (item.tur == IslemTuru.gelir) {
        gelir += item.tutar ?? 0;
      } else {
        gider += item.tutar ?? 0;
      }
    }

    toplamGelir.value = gelir;
    toplamGider.value = gider;
    netBakiye.value = gelir - gider;
  }

  Future<void> islemSil(int id) async {
    await _dbService.islemSil(id);
  }

  Future<void> toggleExclusion(Islem islem, bool value) async {
    if (islem.id != 0) {
      await _dbService.islemDurumuDegistir(islem.id, value);
    }
  }
}
