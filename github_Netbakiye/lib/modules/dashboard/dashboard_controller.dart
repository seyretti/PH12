import 'package:flutter/material.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/models/app_transaction.dart';
import 'package:gelir_gider_uygulamasi/services/supabase_service.dart';

class DashboardController extends GetxController {
  final SupabaseService _supabaseService = Get.find<SupabaseService>();
  final AuthService _authService = Get.find<AuthService>();

  var isLoading = false.obs;
  var myTransactions = <AppTransaction>[].obs;
  var aylikGelir = 0.0.obs;
  var aylikGider = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getTransactions();
  }

  /// Verileri Supabase'den Çeker
  Future<void> getTransactions() async {
    try {
      isLoading.value = true;

      final currentUserId = _authService.currentUser.value?.id;

      if (currentUserId == null) {
        myTransactions.clear();
        aylikGelir.value = 0;
        aylikGider.value = 0;
        return;
      }

      List<Map<String, dynamic>> hamVeriler =
          await _supabaseService.islemleriGetir(currentUserId);

      List<AppTransaction> islenmisListe = hamVeriler.map((e) {
        return AppTransaction.fromJson(e);
      }).toList();

      myTransactions.assignAll(islenmisListe);

      aylikOzet();
    } catch (e) {
      print("Veri Çekme Hatası: $e");
      Get.snackbar(
        "Hata",
        "Veriler yüklenemedi: $e",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Checkbox
  void toggleTransactionExclusion(AppTransaction transaction, bool value) {
    final index = myTransactions.indexWhere((t) => t.id == transaction.id);
    if (index != -1) {
      var updatedTransaction = myTransactions[index].copyWith(
        isExcluded: value,
      );
      myTransactions[index] = updatedTransaction;
      myTransactions.refresh();
      aylikOzet();
    }
  }

  void aylikOzet() {
    double gelirToplam = 0.0;
    double giderToplam = 0.0;

    var simdikiTarih = DateTime.now();
    var buAyinIslemleri = myTransactions.where((t) {
      if (t.date == null) return false;
      return t.date!.year == simdikiTarih.year &&
          t.date!.month == simdikiTarih.month;
    }).toList();

    for (var tr in buAyinIslemleri) {
      if (tr.isExcluded) continue;
      double miktar = double.tryParse(tr.amount.toString()) ?? 0.0;
      String type = tr.type?.toLowerCase() ?? "";

      if (type == 'gelir' || type == 'income') {
        gelirToplam += miktar;
      } else {
        giderToplam += miktar;
      }
    }

    aylikGelir.value = gelirToplam;
    aylikGider.value = giderToplam;
  }

  /// İşlem Silme Fonksiyonu
  Future<void> deleteTransaction(String id) async {
    try {
      await _supabaseService.islemSil(id);

      myTransactions.removeWhere((element) => element.id == id);
      aylikOzet();

      Get.snackbar(
        "Başarılı",
        "İşleminiz silindi.",
        backgroundColor: Colors.green.shade700,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.check_circle, color: Colors.white),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(10),
        borderRadius: 10,
      );
    } catch (e) {
      print("Silme Hatası: $e");
      Get.snackbar("Hata", "Silinemedi: $e");
    }
  }
}
