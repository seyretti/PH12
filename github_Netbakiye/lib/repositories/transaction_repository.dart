import 'package:gelir_gider_uygulamasi/models/app_transaction.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

class TransactionRepository extends GetxService {
  final _supabase = Supabase.instance.client;

  Future<void> createTransaction(AppTransaction transaction) async {
    try {
      await _supabase.from('islemler').insert({
        'baslik': transaction.description,
        'miktar': double.parse(transaction.amount.toString()),
        'tur': transaction.type,
        'tarih': transaction.date?.toIso8601String(),
        'category_id': transaction.categoryId,
        'user_id': transaction.userId,
        'saved_icon': transaction.categoryIcon,
      });
      print("İşlem Eklendi!");
    } catch (e) {
      print("❌ İşlem Eklenemedi!: $e");
      throw e;
    }
  }

  Future<List<AppTransaction>> getTransactions() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return [];
      final response = await _supabase
          .from('islemler')
          .select('*, categories(name, icon)')
          .eq('user_id', user.id)
          .order('tarih', ascending: false);

      final List<AppTransaction> transactions = (response as List).map((row) {
        String? finalIcon = row['saved_icon']?.toString();
        final categoryData = row['categories'];
        String? catName;
        String? catJoinedIcon;

        if (categoryData != null) {
          catName = categoryData['name'];
          catJoinedIcon = categoryData['icon'];
        }

        if (finalIcon == null || finalIcon == "null" || finalIcon.isEmpty) {
          finalIcon = catJoinedIcon;
        }

        return AppTransaction(
          id: row['id']?.toString(),
          amount: row['miktar']?.toString() ?? "0",
          description: row['baslik']?.toString() ?? "",
          type: row['tur']?.toString() ?? "expense",
          date: row['tarih'] != null
              ? DateTime.parse(row['tarih'])
              : DateTime.now(),
          categoryId: row['category_id']?.toString(),
          userId: row['user_id']?.toString(),
          categoryName: catName,
          categoryIcon: finalIcon,
        );
      }).toList();

      return transactions;
    } catch (e) {
      print("❌ Veri Çekme Hatası: $e");
      return [];
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      await _supabase.from('islemler').delete().eq('id', id);
    } catch (e) {
      print("❌ Silme Hatası: $e");
    }
  }
}
