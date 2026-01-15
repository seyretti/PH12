import 'package:get/get.dart';

// --- PROJE İÇİ IMPORTLAR ---
import 'package:gelir_gider_uygulamasi/repositories/category_repository.dart';
import 'package:gelir_gider_uygulamasi/repositories/transaction_repository.dart';
import 'package:gelir_gider_uygulamasi/services/theme_service.dart';
import 'package:gelir_gider_uygulamasi/services/storage_service.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';

// --- İŞTE BU İKİSİ EKSİKTİ ---
import 'package:gelir_gider_uygulamasi/services/db_service.dart'; // <--- BUNU EKLEMEK ŞART
import 'package:gelir_gider_uygulamasi/modules/home/home_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // 1. Servisleri Yükle (Sıralama Önemli!)
    Get.put(StorageService());
    Get.put(AuthService());
    Get.put(ThemeService());

    // --> DBService burada yükleniyor (Hatanın çözümü)
    Get.put(DBService(), permanent: true);

    // 2. Repolar
    Get.put(CategoryRepository());
    Get.put(TransactionRepository());

    // 3. Controller (DBService yüklendikten SONRA gelmeli)
    Get.put(HomeController(), permanent: true);
  }
}
