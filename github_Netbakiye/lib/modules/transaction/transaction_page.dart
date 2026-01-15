import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/widgets/category_dropdown.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/widgets/save_button.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/widgets/add_category_dialog.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;
    final backgroundColor =
        isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F7FA);

    return Scaffold(
      backgroundColor: backgroundColor,
      // --- APP BAR ---
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/arkaplan.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 20),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: Colors.white.withOpacity(0.9), width: 1.5),
          ),
          child: Text(
            controller.pageTitle,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 19, color: Colors.white),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: sheetColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -5))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        left: 24.0,
                        right: 24.0,
                        top: 24.0,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // GELİR / GİDER SEÇİMİ (TAB)
                            Obx(() {
                              final isExpense =
                                  controller.transactionType.value == 'expense';
                              return Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Colors.grey[800]
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    _buildTypeButton(
                                      context: context,
                                      title: "Gider",
                                      icon: Icons.arrow_downward,
                                      isSelected: isExpense,
                                      color: Colors.redAccent,
                                      onTap: () => controller
                                          .changeTransactionType('expense'),
                                    ),
                                    _buildTypeButton(
                                      context: context,
                                      title: "Gelir",
                                      icon: Icons.arrow_upward,
                                      isSelected: !isExpense,
                                      color: Colors.green,
                                      onTap: () => controller
                                          .changeTransactionType('income'),
                                    ),
                                  ],
                                ),
                              );
                            }),

                            const SizedBox(height: 24),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 4, bottom: 6),
                              child: Text(
                                " Kategori seçmek için kutuya tıklayınız",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                  color: isDark
                                      ? Colors.grey[400]
                                      : Colors.grey[600],
                                ),
                              ),
                            ),

                            // KATEGORİ SEÇİM ALANI
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // DROPDOWN ALANI
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? Colors.grey[800]
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: isDark
                                            ? Colors.grey[700]!
                                            : Colors.grey[400]!,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: Obx(() {
                                      return CategoryDropDown(
                                        key: ValueKey(controller
                                            .dropdownForceRefreshID.value),
                                      );
                                    }),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // YENİ KATEGORİ EKLEME BUTONU
                                Column(
                                  children: [
                                    Container(
                                      height: 56,
                                      width: 56,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF31B8F2)
                                            .withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color(0xFF31B8F2)
                                                .withOpacity(0.5),
                                            width: 1.2),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add, size: 30),
                                        color: const Color(0xFF31B8F2),
                                        tooltip: "Yeni Kategori Ekle",
                                        onPressed: () async {
                                          final result = await Get.dialog(
                                            AddCategoryDialog(
                                                transactionType: controller
                                                    .transactionType.value),
                                          );

                                          if (result != null) {
                                            controller.loadCategories(
                                                selectCategoryName: result);
                                            controller
                                                .dropdownForceRefreshID.value++;
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text("Yeni Kategori\nEkle",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                            height: 1.2)),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // TUTAR ALANI
                            TextFormField(
                              controller: controller.amountController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                labelText: 'Tutar (₺)',
                                hintText: "0.00",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                prefixIcon: const Icon(Icons.currency_lira),
                                filled: true,
                                fillColor:
                                    isDark ? Colors.grey[800] : Colors.white,
                              ),
                              onChanged: (val) {
                                controller.amount.value =
                                    double.tryParse(val.replaceAll(',', '.')) ??
                                        0.0;
                              },
                              validator: (val) {
                                if (val == null || val.isEmpty)
                                  return 'Tutar giriniz';
                                final amount =
                                    double.tryParse(val.replaceAll(',', '.'));
                                if (amount == null || amount <= 0)
                                  return 'Geçerli bir tutar giriniz!';
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            // AÇIKLAMA ALANI
                            TextFormField(
                              controller: controller.descriptionController,
                              decoration: InputDecoration(
                                labelText: 'Başlık / Açıklama',
                                hintText: "Örn: Market alışverişi",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                prefixIcon: const Icon(Icons.edit_note),
                                filled: true,
                                fillColor:
                                    isDark ? Colors.grey[800] : Colors.white,
                              ),
                              onChanged: (val) =>
                                  controller.description.value = val,
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return 'Bir açıklama giriniz';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            // TARİH SEÇİMİ
                            InkWell(
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: controller.selectedDate.value,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030),
                                  locale: const Locale('tr', 'TR'),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: isDark
                                            ? const ColorScheme.dark(
                                                primary: Colors.orange)
                                            : const ColorScheme.light(
                                                primary: Colors.orange),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (picked != null) {
                                  controller.selectedDate.value = picked;
                                }
                              },
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Tarih',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  prefixIcon: const Icon(Icons.event),
                                  filled: true,
                                  fillColor:
                                      isDark ? Colors.grey[800] : Colors.white,
                                ),
                                child: Obx(() => Text(
                                      "${controller.selectedDate.value.day}.${controller.selectedDate.value.month}.${controller.selectedDate.value.year}",
                                      style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black87,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                            ),

                            const SizedBox(height: 32),

                            // KAYDET BUTONU
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.15),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const SaveButton(),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Yükleniyor Göstergesi
          Obx(() => controller.isLoading.value
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                      child: CircularProgressIndicator(color: Colors.white)),
                )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget _buildTypeButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required bool isSelected,
    required Color color,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? Colors.grey[700] : Colors.white)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? color : Colors.grey, size: 20),
              const SizedBox(width: 8),
              Text(title,
                  style: TextStyle(
                      color: isSelected ? color : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
