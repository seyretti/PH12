import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/core/base_controller.dart';
import 'package:gelir_gider_uygulamasi/models/gelir_gider.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';
import 'package:gelir_gider_uygulamasi/modules/home/home_controller.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';
import 'package:gelir_gider_uygulamasi/routes/app_pages.dart';

class TransactionController extends BaseController {
  final DBService _dbService = Get.find<DBService>();
  final AuthService _authService = Get.find<AuthService>();

  final categories = <Kategori>[].obs;
  final selectedCategoryId = 0.obs;
  final dropdownForceRefreshID = 0.obs;
  final transactionType = "expense".obs;
  final formKey = GlobalKey<FormState>();

  late TextEditingController descriptionController;
  late TextEditingController amountController;

  final amount = 0.0.obs;
  final description = "".obs;
  final selectedDate = DateTime.now().obs;

  Islem? editingTransaction;

  String get buttonText => editingTransaction == null ? "Kaydet" : "Güncelle";
  String get pageTitle =>
      editingTransaction == null ? "İşlem Ekle" : "İşlemi Düzenle";

  @override
  void onInit() {
    super.onInit();
    descriptionController = TextEditingController();
    amountController = TextEditingController();

    if (Get.arguments != null && Get.arguments is Islem) {
      final Islem trx = Get.arguments as Islem;
      editingTransaction = trx;
      description.value = trx.aciklama ?? "";
      descriptionController.text = trx.aciklama ?? "";
      amount.value = trx.tutar ?? 0.0;
      amountController.text = amount.value.toString();
      selectedDate.value = trx.tarih ?? DateTime.now();
      transactionType.value =
          (trx.tur == IslemTuru.gelir) ? 'income' : 'expense';
    }

    ever(transactionType, (_) => loadCategories());
    loadCategories();
  }

  @override
  void onClose() {
    descriptionController.dispose();
    amountController.dispose();
    super.onClose();
  }

  void changeTransactionType(String type) {
    if (transactionType.value == type) return;
    FocusManager.instance.primaryFocus?.unfocus();
    transactionType.value = type;
    dropdownForceRefreshID.value++;
  }

  Future<void> loadCategories({String? selectCategoryName}) async {
    categories.clear();

    String dbTur = transactionType.value == 'expense' ? 'gider' : 'gelir';
    final currentUserId = _authService.currentUser.value?.id;
    print("📢 Kategori Yükleniyor...");
    print("👤 Aktif Kullanıcı ID: ${currentUserId ?? 'MİSAFİR (NULL)'}");
    List<Kategori> hamListe =
        await _dbService.kategorileriGetir(dbTur, userId: currentUserId);

    Kategori? maasCat;
    Kategori? digerCat;
    List<Kategori> ozelKategoriler = [];
    List<Kategori> standartKategoriler = [];

    for (var kat in hamListe) {
      if (currentUserId == null && kat.userId != null) {
        continue;
      }

      if (kat.ad.toLowerCase() == 'maaş' || kat.ad.toLowerCase() == 'maas') {
        maasCat = kat;
      } else if (kat.ad.toLowerCase() == 'diğer') {
        digerCat = kat;
      } else if (kat.isStandard == false) {
        ozelKategoriler.add(kat);
      } else {
        standartKategoriler.add(kat);
      }
    }

    ozelKategoriler.sort((a, b) => b.id.compareTo(a.id));
    standartKategoriler.sort((a, b) => a.ad.compareTo(b.ad));

    List<Kategori> siraliListe = [];
    if (maasCat != null) siraliListe.add(maasCat);
    siraliListe.addAll(ozelKategoriler);
    siraliListe.addAll(standartKategoriler);
    if (digerCat != null) siraliListe.add(digerCat);

    categories.assignAll(siraliListe);
    print("✅ Toplam Yüklenen Kategori Sayısı: ${categories.length}");

    if (selectCategoryName != null && selectCategoryName.isNotEmpty) {
      final foundCat =
          categories.firstWhereOrNull((c) => c.ad == selectCategoryName);
      if (foundCat != null) selectedCategoryId.value = foundCat.id;
    } else if (editingTransaction != null) {
      final savedCatName = editingTransaction!.kategori;
      final foundCat = categories.firstWhereOrNull((c) => c.ad == savedCatName);
      if (foundCat != null)
        selectedCategoryId.value = foundCat.id;
      else
        _selectDefaultCategory(dbTur);
    } else {
      _selectDefaultCategory(dbTur);
    }
  }

  void _selectDefaultCategory(String dbTur) {
    if (categories.isNotEmpty) {
      if (dbTur == 'gelir') {
        final maas = categories.firstWhereOrNull((c) => c.ad == 'Maaş');
        selectedCategoryId.value = maas?.id ?? categories.first.id;
      } else {
        selectedCategoryId.value = categories.first.id;
      }
    } else {
      selectedCategoryId.value = 0;
    }
  }

  Future<void> saveTransaction() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKey.currentState!.validate()) return;

    if (selectedCategoryId.value == 0) {
      Get.snackbar("Eksik", "Lütfen kategori seçin.",
          backgroundColor: Colors.orange);
      return;
    }

    try {
      setLoading(true);

      final selectedCategory =
          categories.firstWhereOrNull((c) => c.id == selectedCategoryId.value);
      final String categoryName = selectedCategory?.ad ?? "Diğer";
      final String? categoryIcon = selectedCategory?.ikon;
      final IslemTuru tur = transactionType.value == 'expense'
          ? IslemTuru.gider
          : IslemTuru.gelir;
      final currentUserId = _authService.currentUser.value?.id;

      String successMessage = editingTransaction == null
          ? "İşleminiz kaydedildi."
          : "İşleminiz güncellendi.";

      if (editingTransaction != null) {
        await _dbService.islemGuncelle(
          id: editingTransaction!.id,
          tutar: amount.value,
          tur: tur,
          kategori: categoryName,
          ikon: categoryIcon,
          aciklama: description.value,
          tarih: selectedDate.value,
          isExcluded: editingTransaction!.isExcluded,
        );
      } else {
        // --- HATAYI ÇÖZEN KISIM BURASI ---
        await _dbService.islemEkle(
          tutar: amount.value,
          tur: tur,
          kategori: categoryName,
          ikon: categoryIcon,
          aciklama: description.value,
          userId: currentUserId,
          tarih: selectedDate.value, // ARTIK TARİHİ DE GÖNDERİYORUZ
        );
      }

      if (Get.isRegistered<HomeController>()) {
        final homeCtrl = Get.find<HomeController>();
        homeCtrl.changePage(0);
        await homeCtrl.verileriYenile();
      }

      Get.offAllNamed(AppRoutes.HOME);
      Get.snackbar(
        "Başarılı",
        successMessage,
        backgroundColor: Colors.green.shade700,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      print("Kayıt Hatası: $e");
      Get.snackbar("Hata", "Bir sorun oluştu: $e", backgroundColor: Colors.red);
    } finally {
      if (!isClosed) {
        setLoading(false);
      }
    }
  }
}
