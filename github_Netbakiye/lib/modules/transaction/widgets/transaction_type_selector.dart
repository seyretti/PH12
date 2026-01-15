import 'package:flutter/material.dart';
import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';
import 'package:get/get.dart';

class TransactionTypeSelector extends GetView<TransactionController> {
  const TransactionTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SegmentedButton<String>(
        segments: const [
          ButtonSegment<String>(
            value: 'expense',
            label: Text('Gider'),
            icon: Icon(Icons.remove_circle_outline, size: 20),
          ),
          ButtonSegment<String>(
            value: 'income',
            label: Text('Gelir'),
            icon: Icon(Icons.add_circle_outline, size: 20),
          ),
        ],
        selected: {controller.transactionType.value},
        onSelectionChanged: (Set<String> newSelection) {
          controller.changeTransactionType(newSelection.first);
        },
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          ),

          // -------------------------------------------
          backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.selected)) {
              return controller.transactionType.value == 'expense'
                  ? Colors.red.shade100
                  : Colors.green.shade100;
            }
            return null;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.black;
            }
            return Colors.grey.shade700;
          }),
        ),
      ),
    );
  }
}
