import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AmountInput extends GetView<TransactionController> {
  const AmountInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.amountController,

      decoration: const InputDecoration(
        labelText: 'Miktar',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.money_outlined),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text.replaceAll(',', '.');
          return newValue.copyWith(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
        }),
      ],

      // --------------------------------------
      onChanged: (value) {
        controller.amount.value = double.tryParse(value) ?? 0.0;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen bir miktar giriniz';
        }
        final amount = double.tryParse(value.replaceAll(',', '.'));
        if (amount == null || amount <= 0) {
          return 'Geçerli bir miktar giriniz';
        }
        return null;
      },
    );
  }
}
