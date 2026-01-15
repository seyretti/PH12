import 'package:isar/isar.dart';

part 'gelir_gider.g.dart';

@collection
class Islem {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  @Index()
  String? userId;

  @Index()
  String? supabaseId;

  double? tutar;
  @Enumerated(EnumType.ordinal)
  IslemTuru tur;

  String? kategori;
  String? ikon;
  DateTime? tarih;
  String? aciklama;
  bool isSynced = false;
  bool isExcluded;

  Islem({
    this.uuid,
    this.userId,
    this.supabaseId,
    required this.tutar,
    required this.tur,
    required this.kategori,
    this.ikon,
    required this.tarih,
    this.aciklama,
    this.isSynced = false,
    this.isExcluded = false,
  });
}

@collection
class Kategori {
  Id id = Isar.autoIncrement;

  late String ad;
  late String tur;
  late String ikon;
  bool isStandard;
  @Index()
  String? userId;

  Kategori({
    required this.ad,
    required this.tur,
    required this.ikon,
    this.isStandard = false,
    this.userId,
  });
}

enum IslemTuru { gelir, gider }
