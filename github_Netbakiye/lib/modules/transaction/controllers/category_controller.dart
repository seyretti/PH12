import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/core/base_controller.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';

class CategoryController extends BaseController {
  final DBService _dbService = Get.find<DBService>();
  final AuthService _authService = Get.find<AuthService>();

  final nameController = TextEditingController();
  final selectedIcon = "diger".obs;
  final selectedType = "gider".obs;

  // İkon listesi (UI için)
  final List<String> iconList = [
    "maas",
    "harclik",
    "burs",
    "nakit",
    "kredi karti",
    "alacak",
    "ek ders",
    "ek gelir",
    "prim",
    "satis",
    "yatirim",
    "diger",
    "aidat",
    "borc",
    "sigorta",
    "spor",
    "vergi",
    "market",
    "fatura",
    "ulasim",
    "kira",
    "mutfak",
    "saglik",
    "egitim",
    "eglence",
    "giyim",
    "tamirat",
    "tatil"
  ];

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void changeType(String type) {
    selectedType.value = type;
  }

  void changeIcon(String iconName) {
    selectedIcon.value = iconName;
  }

  Future<void> saveCategory() async {
    if (nameController.text.trim().isEmpty) {
      Get.snackbar("Hata", "Lütfen kategori ismi giriniz",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      setLoading(true);

      final currentUserId = _authService.currentUser.value?.id;
      await _dbService.kategoriEkle(
        ad: nameController.text.trim(),
        tur: selectedType.value,
        ikon: selectedIcon.value,
        userId: currentUserId,
      );

      if (Get.isRegistered<TransactionController>()) {
        final trxCtrl = Get.find<TransactionController>();
        if ((trxCtrl.transactionType.value == 'expense' &&
                selectedType.value == 'gider') ||
            (trxCtrl.transactionType.value == 'income' &&
                selectedType.value == 'gelir')) {
          await trxCtrl.loadCategories();
        }
      }

      Get.back();
      Get.snackbar("Başarılı", "Kategori eklendi",
          backgroundColor: Colors.green, colorText: Colors.white);

      nameController.clear();
      selectedIcon.value = "diger";
    } catch (e) {
      Get.snackbar("Hata", "Kategori eklenirken hata: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      setLoading(false);
    }
  }
}
