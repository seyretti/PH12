// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gelir_gider.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIslemCollection on Isar {
  IsarCollection<Islem> get islems => this.collection();
}

const IslemSchema = CollectionSchema(
  name: r'Islem',
  id: 6596374334748681107,
  properties: {
    r'aciklama': PropertySchema(
      id: 0,
      name: r'aciklama',
      type: IsarType.string,
    ),
    r'ikon': PropertySchema(
      id: 1,
      name: r'ikon',
      type: IsarType.string,
    ),
    r'isExcluded': PropertySchema(
      id: 2,
      name: r'isExcluded',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'kategori': PropertySchema(
      id: 4,
      name: r'kategori',
      type: IsarType.string,
    ),
    r'supabaseId': PropertySchema(
      id: 5,
      name: r'supabaseId',
      type: IsarType.string,
    ),
    r'tarih': PropertySchema(
      id: 6,
      name: r'tarih',
      type: IsarType.dateTime,
    ),
    r'tur': PropertySchema(
      id: 7,
      name: r'tur',
      type: IsarType.byte,
      enumMap: _IslemturEnumValueMap,
    ),
    r'tutar': PropertySchema(
      id: 8,
      name: r'tutar',
      type: IsarType.double,
    ),
    r'userId': PropertySchema(
      id: 9,
      name: r'userId',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 10,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _islemEstimateSize,
  serialize: _islemSerialize,
  deserialize: _islemDeserialize,
  deserializeProp: _islemDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'supabaseId': IndexSchema(
      id: 2753382765909358918,
      name: r'supabaseId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'supabaseId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _islemGetId,
  getLinks: _islemGetLinks,
  attach: _islemAttach,
  version: '3.1.0+1',
);

int _islemEstimateSize(
  Islem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aciklama;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ikon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.kategori;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.supabaseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _islemSerialize(
  Islem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aciklama);
  writer.writeString(offsets[1], object.ikon);
  writer.writeBool(offsets[2], object.isExcluded);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.kategori);
  writer.writeString(offsets[5], object.supabaseId);
  writer.writeDateTime(offsets[6], object.tarih);
  writer.writeByte(offsets[7], object.tur.index);
  writer.writeDouble(offsets[8], object.tutar);
  writer.writeString(offsets[9], object.userId);
  writer.writeString(offsets[10], object.uuid);
}

Islem _islemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Islem(
    aciklama: reader.readStringOrNull(offsets[0]),
    ikon: reader.readStringOrNull(offsets[1]),
    isExcluded: reader.readBoolOrNull(offsets[2]) ?? false,
    isSynced: reader.readBoolOrNull(offsets[3]) ?? false,
    kategori: reader.readStringOrNull(offsets[4]),
    supabaseId: reader.readStringOrNull(offsets[5]),
    tarih: reader.readDateTimeOrNull(offsets[6]),
    tur: _IslemturValueEnumMap[reader.readByteOrNull(offsets[7])] ??
        IslemTuru.gelir,
    tutar: reader.readDoubleOrNull(offsets[8]),
    userId: reader.readStringOrNull(offsets[9]),
    uuid: reader.readStringOrNull(offsets[10]),
  );
  object.id = id;
  return object;
}

P _islemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (_IslemturValueEnumMap[reader.readByteOrNull(offset)] ??
          IslemTuru.gelir) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IslemturEnumValueMap = {
  'gelir': 0,
  'gider': 1,
};
const _IslemturValueEnumMap = {
  0: IslemTuru.gelir,
  1: IslemTuru.gider,
};

Id _islemGetId(Islem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _islemGetLinks(Islem object) {
  return [];
}

void _islemAttach(IsarCollection<dynamic> col, Id id, Islem object) {
  object.id = id;
}

extension IslemByIndex on IsarCollection<Islem> {
  Future<Islem?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  Islem? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<Islem?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<Islem?> getAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(Islem object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(Islem object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<Islem> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<Islem> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension IslemQueryWhereSort on QueryBuilder<Islem, Islem, QWhere> {
  QueryBuilder<Islem, Islem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IslemQueryWhere on QueryBuilder<Islem, Islem, QWhereClause> {
  QueryBuilder<Islem, Islem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> uuidNotEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> userIdEqualTo(String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> userIdNotEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> supabaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'supabaseId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> supabaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'supabaseId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> supabaseIdEqualTo(
      String? supabaseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'supabaseId',
        value: [supabaseId],
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterWhereClause> supabaseIdNotEqualTo(
      String? supabaseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supabaseId',
              lower: [],
              upper: [supabaseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supabaseId',
              lower: [supabaseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supabaseId',
              lower: [supabaseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supabaseId',
              lower: [],
              upper: [supabaseId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IslemQueryFilter on QueryBuilder<Islem, Islem, QFilterCondition> {
  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aciklama',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aciklama',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aciklama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aciklama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aciklama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aciklama',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aciklama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aciklama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aciklama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aciklama',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aciklama',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> aciklamaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aciklama',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ikon',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ikon',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ikon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ikon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ikon',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> ikonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ikon',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> isExcludedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isExcluded',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kategori',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kategori',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kategori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kategori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kategori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kategori',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kategori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kategori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kategori',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kategori',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kategori',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> kategoriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kategori',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supabaseId',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supabaseId',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supabaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supabaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supabaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supabaseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supabaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supabaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supabaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supabaseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supabaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> supabaseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supabaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tarihIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tarih',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tarihIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tarih',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tarihEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tarih',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tarihGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tarih',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tarihLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tarih',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tarihBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tarih',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> turEqualTo(
      IslemTuru value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tur',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> turGreaterThan(
    IslemTuru value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tur',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> turLessThan(
    IslemTuru value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tur',
        value: value,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> turBetween(
    IslemTuru lower,
    IslemTuru upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tur',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tutarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tutar',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tutarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tutar',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tutarEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tutar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tutarGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tutar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tutarLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tutar',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> tutarBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tutar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Islem, Islem, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension IslemQueryObject on QueryBuilder<Islem, Islem, QFilterCondition> {}

extension IslemQueryLinks on QueryBuilder<Islem, Islem, QFilterCondition> {}

extension IslemQuerySortBy on QueryBuilder<Islem, Islem, QSortBy> {
  QueryBuilder<Islem, Islem, QAfterSortBy> sortByAciklama() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aciklama', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByAciklamaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aciklama', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByIkon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ikon', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByIkonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ikon', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByIsExcluded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExcluded', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByIsExcludedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExcluded', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByKategori() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kategori', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByKategoriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kategori', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortBySupabaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supabaseId', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortBySupabaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supabaseId', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByTarihDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByTur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tur', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByTurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tur', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByTutar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tutar', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByTutarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tutar', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension IslemQuerySortThenBy on QueryBuilder<Islem, Islem, QSortThenBy> {
  QueryBuilder<Islem, Islem, QAfterSortBy> thenByAciklama() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aciklama', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByAciklamaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aciklama', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByIkon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ikon', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByIkonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ikon', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByIsExcluded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExcluded', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByIsExcludedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExcluded', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByKategori() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kategori', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByKategoriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kategori', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenBySupabaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supabaseId', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenBySupabaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supabaseId', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByTarihDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByTur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tur', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByTurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tur', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByTutar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tutar', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByTutarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tutar', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Islem, Islem, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension IslemQueryWhereDistinct on QueryBuilder<Islem, Islem, QDistinct> {
  QueryBuilder<Islem, Islem, QDistinct> distinctByAciklama(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aciklama', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByIkon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ikon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByIsExcluded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isExcluded');
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByKategori(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kategori', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctBySupabaseId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supabaseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tarih');
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByTur() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tur');
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByTutar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tutar');
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Islem, Islem, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension IslemQueryProperty on QueryBuilder<Islem, Islem, QQueryProperty> {
  QueryBuilder<Islem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Islem, String?, QQueryOperations> aciklamaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aciklama');
    });
  }

  QueryBuilder<Islem, String?, QQueryOperations> ikonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ikon');
    });
  }

  QueryBuilder<Islem, bool, QQueryOperations> isExcludedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isExcluded');
    });
  }

  QueryBuilder<Islem, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<Islem, String?, QQueryOperations> kategoriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kategori');
    });
  }

  QueryBuilder<Islem, String?, QQueryOperations> supabaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supabaseId');
    });
  }

  QueryBuilder<Islem, DateTime?, QQueryOperations> tarihProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tarih');
    });
  }

  QueryBuilder<Islem, IslemTuru, QQueryOperations> turProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tur');
    });
  }

  QueryBuilder<Islem, double?, QQueryOperations> tutarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tutar');
    });
  }

  QueryBuilder<Islem, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<Islem, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKategoriCollection on Isar {
  IsarCollection<Kategori> get kategoris => this.collection();
}

const KategoriSchema = CollectionSchema(
  name: r'Kategori',
  id: 3062283759416018559,
  properties: {
    r'ad': PropertySchema(
      id: 0,
      name: r'ad',
      type: IsarType.string,
    ),
    r'ikon': PropertySchema(
      id: 1,
      name: r'ikon',
      type: IsarType.string,
    ),
    r'isStandard': PropertySchema(
      id: 2,
      name: r'isStandard',
      type: IsarType.bool,
    ),
    r'tur': PropertySchema(
      id: 3,
      name: r'tur',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 4,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _kategoriEstimateSize,
  serialize: _kategoriSerialize,
  deserialize: _kategoriDeserialize,
  deserializeProp: _kategoriDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _kategoriGetId,
  getLinks: _kategoriGetLinks,
  attach: _kategoriAttach,
  version: '3.1.0+1',
);

int _kategoriEstimateSize(
  Kategori object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ad.length * 3;
  bytesCount += 3 + object.ikon.length * 3;
  bytesCount += 3 + object.tur.length * 3;
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _kategoriSerialize(
  Kategori object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ad);
  writer.writeString(offsets[1], object.ikon);
  writer.writeBool(offsets[2], object.isStandard);
  writer.writeString(offsets[3], object.tur);
  writer.writeString(offsets[4], object.userId);
}

Kategori _kategoriDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Kategori(
    ad: reader.readString(offsets[0]),
    ikon: reader.readString(offsets[1]),
    isStandard: reader.readBoolOrNull(offsets[2]) ?? false,
    tur: reader.readString(offsets[3]),
    userId: reader.readStringOrNull(offsets[4]),
  );
  object.id = id;
  return object;
}

P _kategoriDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kategoriGetId(Kategori object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kategoriGetLinks(Kategori object) {
  return [];
}

void _kategoriAttach(IsarCollection<dynamic> col, Id id, Kategori object) {
  object.id = id;
}

extension KategoriQueryWhereSort on QueryBuilder<Kategori, Kategori, QWhere> {
  QueryBuilder<Kategori, Kategori, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KategoriQueryWhere on QueryBuilder<Kategori, Kategori, QWhereClause> {
  QueryBuilder<Kategori, Kategori, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterWhereClause> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterWhereClause> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterWhereClause> userIdEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterWhereClause> userIdNotEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension KategoriQueryFilter
    on QueryBuilder<Kategori, Kategori, QFilterCondition> {
  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ad',
        value: '',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> adIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ad',
        value: '',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ikon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ikon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ikon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ikon',
        value: '',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> ikonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ikon',
        value: '',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> isStandardEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isStandard',
        value: value,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tur',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tur',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tur',
        value: '',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> turIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tur',
        value: '',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension KategoriQueryObject
    on QueryBuilder<Kategori, Kategori, QFilterCondition> {}

extension KategoriQueryLinks
    on QueryBuilder<Kategori, Kategori, QFilterCondition> {}

extension KategoriQuerySortBy on QueryBuilder<Kategori, Kategori, QSortBy> {
  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByAd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ad', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByAdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ad', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByIkon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ikon', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByIkonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ikon', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByIsStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStandard', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByIsStandardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStandard', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByTur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tur', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByTurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tur', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension KategoriQuerySortThenBy
    on QueryBuilder<Kategori, Kategori, QSortThenBy> {
  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByAd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ad', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByAdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ad', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByIkon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ikon', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByIkonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ikon', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByIsStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStandard', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByIsStandardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStandard', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByTur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tur', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByTurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tur', Sort.desc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Kategori, Kategori, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension KategoriQueryWhereDistinct
    on QueryBuilder<Kategori, Kategori, QDistinct> {
  QueryBuilder<Kategori, Kategori, QDistinct> distinctByAd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Kategori, Kategori, QDistinct> distinctByIkon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ikon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Kategori, Kategori, QDistinct> distinctByIsStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isStandard');
    });
  }

  QueryBuilder<Kategori, Kategori, QDistinct> distinctByTur(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tur', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Kategori, Kategori, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension KategoriQueryProperty
    on QueryBuilder<Kategori, Kategori, QQueryProperty> {
  QueryBuilder<Kategori, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Kategori, String, QQueryOperations> adProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ad');
    });
  }

  QueryBuilder<Kategori, String, QQueryOperations> ikonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ikon');
    });
  }

  QueryBuilder<Kategori, bool, QQueryOperations> isStandardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isStandard');
    });
  }

  QueryBuilder<Kategori, String, QQueryOperations> turProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tur');
    });
  }

  QueryBuilder<Kategori, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
