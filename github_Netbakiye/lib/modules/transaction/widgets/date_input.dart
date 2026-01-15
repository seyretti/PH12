import 'package:flutter/material.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class DateInput extends GetView<TransactionController> {
  const DateInput({super.key});

  String _formatDate(DateTime date) {
    return DateFormat('d MMMM yyyy', 'tr').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        title: const Text("Tarih"),
        subtitle: Text(_formatDate(controller.selectedDate.value)),
        trailing: const Icon(Icons.calendar_today),
        onTap: () async {
          final DateTime? secilenTarih = await showDatePicker(
            context: context,
            initialDate: controller.selectedDate.value,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            locale: const Locale('tr', 'TR'),
          );
          if (secilenTarih != null) {
            controller.selectedDate.value = secilenTarih;
          }
        },
      ),
    );
  }
}
