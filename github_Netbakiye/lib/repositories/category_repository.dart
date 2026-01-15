import 'package:gelir_gider_uygulamasi/models/app_category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';

class CategoryRepository {
  final _supabase = Supabase.instance.client;
  final AuthService _authService = Get.find<AuthService>();

  Future<void> createCategory(AppCategory category) async {
    try {
      if (category.userId == null) {
        throw Exception("Kullanıcı ID bulunamadı, kayıt yapılamaz.");
      }
      await _supabase.from('categories').insert({
        'name': category.name,
        'type': category.type,
        'icon': category.icon,
        'is_system': false,
        'user_id': category.userId,
      });
    } catch (e) {
      print("Kategori eklenemedi!: $e");
      throw e;
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _supabase.from('categories').delete().eq('id', id);
    } catch (e) {
      print("❌ Kategori silme hatası: $e");
      throw e;
    }
  }

  Future<List<AppCategory>> getCategories(String currentUserId) async {
    try {
      print("Veriler getiriliyor...");
      final authUser = _authService.currentUser.value;
      final userId = authUser?.id ?? _supabase.auth.currentUser?.id;
      var query = _supabase.from('categories').select();
      if (userId != null) {
        query = query.or('is_system.eq.true,user_id.eq.$userId');
      } else {
        query = query.eq('is_system', true);
      }

      final List<dynamic> response = await query.order('name', ascending: true);
      print("Toplam ${response.length} kategori çekildi.");
      if (response.isEmpty) {
        return [];
      }
      final List<AppCategory> categories = response.map((row) {
        return AppCategory(
          id: row['id']?.toString(),
          name: row['name'],
          type: row['type'],
          icon: row['icon'],
          isSystem: row['is_system'] == true,
          userId: row['user_id']?.toString(),
        );
      }).toList();
      return categories;
    } catch (e) {
      print("Hata: $e");
      return [];
    }
  }
}
