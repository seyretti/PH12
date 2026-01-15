import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';

class SaveButton extends GetView<TransactionController> {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = controller.editingTransaction != null;
    final buttonText = isEditing ? 'Güncelle' : 'Kaydet';
    final buttonIcon = isEditing ? Icons.update_rounded : Icons.save_rounded;

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: Obx(() {
        final isLoading = controller.isLoading.value;

        return ElevatedButton.icon(
          onPressed: isLoading
              ? null
              : () async {
                  await controller.saveTransaction();
                },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isEditing ? Colors.orange.shade700 : const Color(0xFF1565C0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
          ),
          icon: isLoading
              ? const SizedBox.shrink()
              : Icon(buttonIcon, size: 24, color: Colors.white),
          label: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  buttonText,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
        );
      }),
    );
  }
}
