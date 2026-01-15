import 'package:flutter/material.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DescriptionInput extends GetView<TransactionController> {
  const DescriptionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.descriptionController,
      decoration: const InputDecoration(
        labelText: 'Başlık/Açıklama',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.description_outlined),
      ),
      maxLines: 2,
      onChanged: (value) {
        controller.description.value = value;
      },
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Bir Başlık/açıklama giriniz';
        }
        return null;
      },
    );
  }
}
