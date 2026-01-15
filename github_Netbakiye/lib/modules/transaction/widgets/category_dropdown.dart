import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';
import 'package:gelir_gider_uygulamasi/models/gelir_gider.dart';
import 'package:gelir_gider_uygulamasi/utils/icon_helper.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';

class CategoryDropDown extends GetView<TransactionController> {
  const CategoryDropDown({super.key});

  Widget _buildIconOrImage(
      String? catName, String? iconName, Color color, double size) {
    final String cName = (catName ?? "").toLowerCase();
    final String iName = (iconName ?? "").toLowerCase();

    bool isHealthRelated = cName.contains('kizilay') ||
        iName.contains('kizilay') ||
        cName.contains('kızılay') ||
        iName.contains('kızılay') ||
        cName.contains('hastane') ||
        iName.contains('hastane') ||
        cName.contains('doktor') ||
        iName.contains('doktor') ||
        cName.contains('sağlık') ||
        iName.contains('sağlık') ||
        cName.contains('saglik') ||
        iName.contains('saglik') ||
        cName.contains('hilal') ||
        iName.contains('hilal');

    if (isHealthRelated) {
      return Image.asset(
        'assets/images/kizilay.png',
        width: size + 10,
        height: size + 10,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.favorite, color: color, size: size),
      );
    }
    return Icon(
        getAppIcon(iconName != null && iconName.isNotEmpty ? iconName : cName),
        color: color,
        size: size);
  }

  Future<bool?> _showDeleteConfirmDialog(
      BuildContext context, String categoryName) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Kategoriyi Sil"),
        content:
            Text("'$categoryName' kategorisini silmek istediğine emin misin?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text("İptal", style: TextStyle(color: Colors.grey))),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text("Sil",
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  // silme islemi
  Future<void> _deleteCategory(
      BuildContext context, int id, String categoryName) async {
    final dbService = Get.find<DBService>();
    final authService = Get.find<AuthService>();

    final userId = authService.currentUser.value?.id;

    await dbService.kategoriSil(id, userId);

    controller.loadCategories();
    controller.dropdownForceRefreshID.value++;
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }

    Get.snackbar("Başarılı", "$categoryName kategorisi silindi.",
        backgroundColor: Colors.green.shade700,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final searchType =
          controller.transactionType.value == 'expense' ? 'gider' : 'gelir';

      return InkWell(
        onTap: () {
          if (controller.categories.isNotEmpty) {
            final filteredList = controller.categories
                .where((category) => category.tur == searchType)
                .toList();
            if (filteredList.isNotEmpty) {
              _showCategoryTopSheet(context, filteredList, controller);
            } else {
              Get.snackbar("Uyarı", "Bu türde kategori bulunamadı.");
            }
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            suffixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
          ),
          child: Row(
            children: [
              if (controller.selectedCategoryId.value != 0) ...[
                Text(
                    controller.categories
                            .firstWhereOrNull((c) =>
                                c.id == controller.selectedCategoryId.value)
                            ?.ad ??
                        "",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)),
              ] else
                const Text("Kategori Seçiniz",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
        ),
      );
    });
  }

  void _showCategoryTopSheet(BuildContext context, List<Kategori> categories,
      TransactionController controller) {
    final typeColor = controller.transactionType.value == 'income'
        ? Colors.green
        : Colors.redAccent;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;

    Get.dialog(
      Align(
          alignment: Alignment.topCenter,
          child: Material(
              color: Colors.transparent,
              child: Container(
                  margin: const EdgeInsets.only(
                      top: 80, left: 16, right: 16, bottom: 50),
                  decoration: BoxDecoration(
                      color: sheetColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5))
                      ]),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: typeColor.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Kategori Seç",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: typeColor)),
                          IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Get.back()),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: categories.length,
                            separatorBuilder: (context, index) => Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Colors.grey.withOpacity(0.2)),
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              final bool isSystemCategory = category.isStandard;
                              return Dismissible(
                                key: Key(category.id.toString()),
                                direction: isSystemCategory
                                    ? DismissDirection.none
                                    : DismissDirection.endToStart,
                                background: Container(
                                  color: Colors.redAccent,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20),
                                  child: const Icon(Icons.delete,
                                      color: Colors.white),
                                ),
                                confirmDismiss: (direction) async {
                                  return await _showDeleteConfirmDialog(
                                      context, category.ad);
                                },
                                onDismissed: (direction) async {
                                  await _deleteCategory(
                                      context, category.id, category.ad);
                                },
                                child: ListTile(
                                  leading: _buildIconOrImage(category.ad,
                                      category.ikon, typeColor, 24),
                                  title: Text(category.ad,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black87)),
                                  trailing: isSystemCategory
                                      ? const IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.lock,
                                              size: 20, color: Colors.grey),
                                        )
                                      : IconButton(
                                          icon: const Icon(Icons.delete_outline,
                                              color: Colors.redAccent),
                                          onPressed: () async {
                                            final confirm =
                                                await _showDeleteConfirmDialog(
                                                    context, category.ad);
                                            if (confirm == true) {
                                              await _deleteCategory(context,
                                                  category.id, category.ad);
                                            }
                                          },
                                        ),
                                  onTap: () {
                                    controller.selectedCategoryId.value =
                                        category.id;
                                    Get.back();
                                  },
                                ),
                              );
                            })),
                  ])))),
      barrierDismissible: true,
    );
  }
}
