import 'package:gelir_gider_uygulamasi/modules/transaction/controllers/transaction_controller.dart';
import 'package:get/get.dart'; // instance_manager yerine get.dart daha geneldir

class TransactionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController(), fenix: true);
  }
}
