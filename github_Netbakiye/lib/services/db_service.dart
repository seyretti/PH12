import 'dart:async';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gelir_gider_uygulamasi/models/gelir_gider.dart';
import 'package:gelir_gider_uygulamasi/services/supabase_service.dart';

class DBService extends GetxService {
  late Isar isar;
  final SupabaseService _supabaseService = Get.find<SupabaseService>();
  bool _isSyncing = false;

  Future<DBService> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [IslemSchema, KategoriSchema],
      directory: dir.path,
    );
    await _baslangicKategorileriniYukle();
    return this;
  }

  Future<List<Kategori>> kategorileriGetir(String tur, {String? userId}) async {
    if (userId != null) {
      return await isar.kategoris
          .filter()
          .turEqualTo(tur)
          .and()
          .group((q) => q.isStandardEqualTo(true).or().userIdEqualTo(userId))
          .findAll();
    } else {
      return await isar.kategoris
          .filter()
          .turEqualTo(tur)
          .and()
          .group((q) => q.isStandardEqualTo(true).or().userIdIsNull())
          .findAll();
    }
  }

  Future<void> kategoriEkleIsar(Kategori kategori) async {
    // Çift Kayıt Kontrolü (Yerel)
    // Aynı isimde ve türde kategori var mı?
    final mevcut = await isar.kategoris
        .filter()
        .adEqualTo(kategori.ad)
        .turEqualTo(kategori.tur)
        .and()
        .group((q) =>
            q.userIdEqualTo(kategori.userId).or().isStandardEqualTo(true))
        .findFirst();

    if (mevcut != null) {
      print("⚠️ Bu kategori zaten var: ${kategori.ad}");
      return;
    }
    await isar.writeTxn(() async {
      await isar.kategoris.put(kategori);
    });
    if (kategori.userId != null) {
      butunVerileriSenkronizeEt(kategori.userId!);
    }
  }

  Future<void> kategoriEkle({
    required String ad,
    required String tur,
    required String ikon,
    String? userId,
  }) async {
    await kategoriEkleIsar(Kategori(
        ad: ad, tur: tur, ikon: ikon, isStandard: false, userId: userId));
  }

  Future<void> butunVerileriSenkronizeEt(String userId) async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      // 1. Buluttaki kategorileri çek
      final cloudCats = await _supabaseService.kategorileriGetir(userId);
      // 2. Yereldeki özel kategorileri çek
      final localCats = await isar.kategoris
          .filter()
          .userIdEqualTo(userId)
          .isStandardEqualTo(false)
          .findAll();
      await isar.writeTxn(() async {
        for (var localCat in localCats) {
          // İsim ve Tip kontrolü
          bool existsInCloud = cloudCats.any(
              (c) => c['name'] == localCat.ad && c['type'] == localCat.tur);

          if (!existsInCloud) {
            try {
              await _supabaseService.kategoriEkle(
                  name: localCat.ad,
                  type: localCat.tur,
                  icon: localCat.ikon,
                  userId: userId);
            } catch (e) {
              print("Kat Upload Hatası: $e");
            }
          }
        }

        for (var cloudCat in cloudCats) {
          // İsim ve Tip kontrolü
          bool existsLocally = localCats.any(
              (l) => l.ad == cloudCat['name'] && l.tur == cloudCat['type']);

          if (!existsLocally) {
            final isStandardExists = await isar.kategoris
                .filter()
                .adEqualTo(cloudCat['name'])
                .turEqualTo(cloudCat['type'])
                .isStandardEqualTo(true)
                .findFirst();

            if (isStandardExists == null) {
              await isar.kategoris.put(Kategori(
                ad: cloudCat['name'],
                tur: cloudCat['type'] ?? 'gider',
                ikon: cloudCat['icon'] ?? 'diger',
                isStandard: false,
                userId: userId,
              ));
            }
          }
        }
      });

      List<String> justUploadedIds = [];

      final cloudTrxRaw = await _supabaseService.islemleriGetir(userId);
      final cloudTrx =
          cloudTrxRaw.where((x) => x['user_id'] == userId).toList();

      final localUnsyncedTrx = await isar.islems
          .filter()
          .userIdEqualTo(userId)
          .supabaseIdIsNull()
          .findAll();

      await isar.writeTxn(() async {
        for (var localIslem in localUnsyncedTrx) {
          var alreadyInCloud = cloudTrx
              .firstWhereOrNull((c) => _isSameTransaction(localIslem, c));

          if (alreadyInCloud != null) {
            localIslem.supabaseId = alreadyInCloud['id'].toString();
            localIslem.isSynced = true;
            await isar.islems.put(localIslem);
          } else {
            try {
              final remoteId = await _supabaseService.islemEkle(
                baslik: localIslem.aciklama ?? "",
                miktar: localIslem.tutar ?? 0,
                tur: localIslem.tur == IslemTuru.gelir ? 'gelir' : 'gider',
                userId: userId,
                categoryId: localIslem.kategori ?? "Diğer",
                savedIcon: localIslem.ikon ?? "",
                tarih: localIslem.tarih ?? DateTime.now(),
              );

              if (remoteId != null) {
                localIslem.supabaseId = remoteId;
                localIslem.isSynced = true;
                await isar.islems.put(localIslem);
                justUploadedIds.add(remoteId);
              }
            } catch (e) {
              print("Trx Upload hatası: $e");
            }
          }
        }

        for (var data in cloudTrx) {
          final remoteId = data['id'].toString();
          if (justUploadedIds.contains(remoteId)) continue;

          final existing = await isar.islems
              .filter()
              .supabaseIdEqualTo(remoteId)
              .findFirst();

          if (existing == null) {
            final ghost = await isar.islems
                .filter()
                .userIdEqualTo(userId)
                .supabaseIdIsNull()
                .findAll()
                .then((list) =>
                    list.firstWhereOrNull((l) => _isSameTransaction(l, data)));

            if (ghost != null) {
              ghost.supabaseId = remoteId;
              ghost.isSynced = true;
              await isar.islems.put(ghost);
            } else {
              final yeniIslem = Islem(
                uuid: const Uuid().v4(),
                userId: userId,
                supabaseId: remoteId,
                aciklama: data['baslik'],
                tutar: (data['miktar'] as num).toDouble(),
                tur: (data['tur'] == 'gelir')
                    ? IslemTuru.gelir
                    : IslemTuru.gider,
                kategori: data['category_id'] ?? "Diğer",
                ikon: data['saved_icon'],
                tarih: DateTime.parse(data['tarih']),
                isSynced: true,
              );
              await isar.islems.put(yeniIslem);
            }
          }
        }
      });
    } catch (e) {
      print("Senk Hatası: $e");
    } finally {
      _isSyncing = false;
    }
  }

//misafire devir
  Future<void> misafirVerileriniKullaniciyaAta(String userId) async {
    await isar.writeTxn(() async {
      final misafirIslemler =
          await isar.islems.filter().userIdIsNull().findAll();
      for (var islem in misafirIslemler) {
        islem.userId = userId;
        islem.isSynced = false;
        await isar.islems.put(islem);
      }
//kategorileri devir
      final misafirKategoriler = await isar.kategoris
          .filter()
          .userIdIsNull()
          .isStandardEqualTo(false)
          .findAll();

      for (var misafirKat in misafirKategoriler) {
        // Çakışma kontrolü: Kullanıcının zaten böyle bir kategorisi var mı?
        final mevcut = await isar.kategoris
            .filter()
            .userIdEqualTo(userId)
            .adEqualTo(misafirKat.ad)
            .turEqualTo(misafirKat.tur)
            .findFirst();

        if (mevcut != null) {
          // Varsa misafirinkini sil
          await isar.kategoris.delete(misafirKat.id);
        } else {
          // Yoksa devret
          misafirKat.userId = userId;
          await isar.kategoris.put(misafirKat);
        }
      }
    });
  }

  bool _isSameTransaction(Islem local, Map<String, dynamic> cloud) {
    double cloudAmount = (cloud['miktar'] as num).toDouble();
    if ((local.tutar! - cloudAmount).abs() > 0.01) return false;
    if (local.aciklama != cloud['baslik']) return false;
    final cDate = DateTime.parse(cloud['tarih']).toLocal();
    final lDate = local.tarih?.toLocal() ?? DateTime.now();
    return cDate.year == lDate.year &&
        cDate.month == lDate.month &&
        cDate.day == lDate.day;
  }

  Future<void> islemEkle(
      {required double tutar,
      required IslemTuru tur,
      required String kategori,
      required DateTime tarih,
      String? ikon,
      String? aciklama,
      String? userId,
      bool isExcluded = false}) async {
    final yeniIslem = Islem(
        uuid: const Uuid().v4(),
        userId: userId,
        tutar: tutar,
        tur: tur,
        kategori: kategori,
        ikon: ikon,
        aciklama: aciklama,
        tarih: tarih,
        isSynced: false,
        isExcluded: isExcluded);
    await isar.writeTxn(() async {
      await isar.islems.put(yeniIslem);
    });
    if (userId != null) butunVerileriSenkronizeEt(userId);
  }

  Future<void> islemGuncelle(
      {required int id,
      required double tutar,
      required IslemTuru tur,
      required String kategori,
      String? ikon,
      String? aciklama,
      required DateTime tarih,
      String? uuid,
      bool isExcluded = false}) async {
    Islem? guncellenenIslem;
    await isar.writeTxn(() async {
      final islem = await isar.islems.get(id);
      if (islem != null) {
        islem.tutar = tutar;
        islem.tur = tur;
        islem.kategori = kategori;
        islem.ikon = ikon;
        islem.aciklama = aciklama;
        islem.tarih = tarih;
        if (uuid != null) islem.uuid = uuid;
        islem.isExcluded = isExcluded;
        islem.isSynced = false;
        await isar.islems.put(islem);
        guncellenenIslem = islem;
      }
    });
    if (guncellenenIslem != null && guncellenenIslem!.supabaseId != null) {
      _supabaseService
          .islemGuncelle(
              id: guncellenenIslem!.supabaseId!,
              baslik: aciklama ?? "",
              miktar: tutar,
              tur: tur == IslemTuru.gelir ? 'gelir' : 'gider',
              categoryId: kategori,
              savedIcon: ikon ?? "",
              tarih: tarih)
          .catchError((_) {});
    }
  }

  Future<void> islemSil(int id) async {
    String? remoteId;
    final islem = await isar.islems.get(id);
    if (islem != null) remoteId = islem.supabaseId;
    await isar.writeTxn(() async {
      await isar.islems.delete(id);
    });
    if (remoteId != null)
      _supabaseService.islemSil(remoteId).catchError((_) {});
  }

  Future<void> islemDurumuDegistir(int id, bool excluded) async {
    await isar.writeTxn(() async {
      final islem = await isar.islems.get(id);
      if (islem != null) {
        islem.isExcluded = excluded;
        islem.isSynced = false;
        await isar.islems.put(islem);
      }
    });
  }

  Future<void> updateSupabaseId(int localId, String remoteId) async {
    await isar.writeTxn(() async {
      final islem = await isar.islems.get(localId);
      if (islem != null) {
        islem.supabaseId = remoteId;
        islem.isSynced = true;
        await isar.islems.put(islem);
      }
    });
  }

  Future<void> kategoriSil(int localId, String? userId) async {
    final k = await isar.kategoris.get(localId);
    await isar.writeTxn(() async {
      await isar.kategoris.delete(localId);
    });
    if (userId != null && k != null)
      _supabaseService.kategoriSil(name: k.ad, userId: userId);
  }

  Future<void> kullaniciVerileriniTemizle() async {
    await isar.writeTxn(() async {
      await isar.islems.filter().userIdIsNotNull().deleteAll();
      await isar.kategoris.filter().userIdIsNotNull().deleteAll();
    });
  }

  Future<void> misafirVerileriniSil() async {
    await isar.writeTxn(() async {
      await isar.islems.filter().userIdIsNull().deleteAll();
      await isar.kategoris
          .filter()
          .userIdIsNull()
          .isStandardEqualTo(false)
          .deleteAll();
    });
  }

  Future<List<Islem>> getMisafirIslemleri() async =>
      await isar.islems.filter().userIdIsNull().findAll();
  Future<List<Kategori>> getOzelKategoriler() async =>
      await isar.kategoris.filter().isStandardEqualTo(false).findAll();

  Future<void> _baslangicKategorileriniYukle() async {
    final standartlar = [
      Kategori(ad: "Maaş", tur: "gelir", ikon: "maas", isStandard: true),
      Kategori(ad: "Harçlık", tur: "gelir", ikon: "harclik", isStandard: true),
      Kategori(ad: "Burs", tur: "gelir", ikon: "burs", isStandard: true),
      Kategori(ad: "Nakit", tur: "gelir", ikon: "nakit", isStandard: true),
      Kategori(
          ad: "Kredi Kartı",
          tur: "gelir",
          ikon: "kredi karti",
          isStandard: true),
      Kategori(ad: "Alacak", tur: "gelir", ikon: "alacak", isStandard: true),
      Kategori(ad: "Ek Ders", tur: "gelir", ikon: "ek ders", isStandard: true),
      Kategori(
          ad: "Ek Gelir", tur: "gelir", ikon: "ek gelir", isStandard: true),
      Kategori(ad: "Prim", tur: "gelir", ikon: "prim", isStandard: true),
      Kategori(ad: "Satış", tur: "gelir", ikon: "satis", isStandard: true),
      Kategori(ad: "Yatırım", tur: "gelir", ikon: "yatirim", isStandard: true),
      Kategori(ad: "Diğer", tur: "gelir", ikon: "diger", isStandard: true),
      Kategori(ad: "Aidat", tur: "gider", ikon: "aidat", isStandard: true),
      Kategori(ad: "Bağış", tur: "gider", ikon: "bagis", isStandard: true),
      Kategori(ad: "Borç", tur: "gider", ikon: "borc", isStandard: true),
      Kategori(
          ad: "Kredi Kartı",
          tur: "gider",
          ikon: "kredi karti",
          isStandard: true),
      Kategori(ad: "Sigorta", tur: "gider", ikon: "sigorta", isStandard: true),
      Kategori(ad: "Spor", tur: "gider", ikon: "spor", isStandard: true),
      Kategori(ad: "Vergi", tur: "gider", ikon: "vergi", isStandard: true),
      Kategori(ad: "Market", tur: "gider", ikon: "market", isStandard: true),
      Kategori(ad: "Fatura", tur: "gider", ikon: "fatura", isStandard: true),
      Kategori(ad: "Ulaşım", tur: "gider", ikon: "ulasim", isStandard: true),
      Kategori(ad: "Kira", tur: "gider", ikon: "kira", isStandard: true),
      Kategori(ad: "Mutfak", tur: "gider", ikon: "mutfak", isStandard: true),
      Kategori(ad: "Sağlık", tur: "gider", ikon: "saglik", isStandard: true),
      Kategori(ad: "Eğitim", tur: "gider", ikon: "egitim", isStandard: true),
      Kategori(ad: "Giyim", tur: "gider", ikon: "giyim", isStandard: true),
      Kategori(ad: "Hobi", tur: "gider", ikon: "hobi", isStandard: true),
      Kategori(ad: "Tamirat", tur: "gider", ikon: "tamirat", isStandard: true),
      Kategori(ad: "Tatil", tur: "gider", ikon: "tatil", isStandard: true),
      Kategori(ad: "Diğer", tur: "gider", ikon: "diger", isStandard: true),
    ];

    await isar.writeTxn(() async {
      for (var kat in standartlar) {
        final mevcutMu = await isar.kategoris
            .filter()
            .adEqualTo(kat.ad)
            .turEqualTo(kat.tur)
            .findFirst();
        if (mevcutMu == null) await isar.kategoris.put(kat);
      }
    });
  }
}
