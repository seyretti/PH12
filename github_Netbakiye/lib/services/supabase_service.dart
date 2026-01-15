import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

class SupabaseService extends GetxService {
  final supabase = Supabase.instance.client;

  // --- İŞLEMLER ---
  Future<String?> islemEkle({
    required String baslik,
    required double miktar,
    required String tur,
    required String userId,
    required String categoryId,
    required String savedIcon,
    required DateTime tarih,
  }) async {
    try {
      final response = await supabase
          .from('islemler')
          .insert({
            'baslik': baslik,
            'miktar': miktar,
            'tur': tur,
            'user_id': userId,
            'category_id': categoryId,
            'saved_icon': savedIcon,
            'tarih': tarih.toIso8601String(),
          })
          .select()
          .single();

      return response['id'].toString();
    } catch (e) {
      print("Supabase Ekleme Hatası: $e");
      return null;
    }
  }

  Future<void> islemGuncelle({
    required String id,
    required String baslik,
    required double miktar,
    required String tur,
    required String categoryId,
    required String savedIcon,
    required DateTime tarih,
  }) async {
    try {
      await supabase.from('islemler').update({
        'baslik': baslik,
        'miktar': miktar,
        'tur': tur,
        'category_id': categoryId,
        'saved_icon': savedIcon,
        'tarih': tarih.toIso8601String(),
      }).eq('id', id);
    } catch (e) {
      print("Supabase Güncelleme Hatası: $e");
    }
  }

  Future<void> islemSil(String id) async {
    try {
      await supabase.from('islemler').delete().eq('id', id);
    } catch (e) {
      print("Supabase Silme Hatası: $e");
    }
  }

  Future<List<Map<String, dynamic>>> islemleriGetir(String userId) async {
    try {
      final response = await supabase
          .from('islemler')
          .select()
          .order('tarih', ascending: false);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print("Veri Çekme Hatası: $e");
      return [];
    }
  }

  // --- KATEGORİLER ---

  Future<String?> kategoriEkle({
    required String name,
    required String type,
    required String icon,
    required String userId,
  }) async {
    try {
      final response = await supabase
          .from('categories')
          .insert({
            'name': name,
            'type': type,
            'icon': icon,
            'user_id': userId,
            'is_system': false,
          })
          .select()
          .single();

      return response['id'].toString();
    } catch (e) {
      print("Supabase Kategori Ekleme Hatası: $e");
      return null;
    }
  }

  Future<void> kategoriSil({
    required String name,
    required String userId,
  }) async {
    try {
      await supabase
          .from('categories')
          .delete()
          .match({'name': name, 'user_id': userId});
    } catch (e) {
      print("Supabase Kategori Silme Hatası: $e");
    }
  }

  Future<List<Map<String, dynamic>>> kategorileriGetir(String userId) async {
    try {
      final response =
          await supabase.from('categories').select().eq('user_id', userId);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print("❌ Kategori Çekme Hatası: $e");
      return [];
    }
  }

  Future<void> kullaniciVerileriniBuluttanSil(String userId) async {
    try {
      await supabase.rpc('delete_user');
    } catch (e) {
      print("❌ Bulut silme hatası: $e");
    }
  }
}
