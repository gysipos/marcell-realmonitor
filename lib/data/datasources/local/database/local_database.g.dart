// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CountyData extends DataClass implements Insertable<CountyData> {
  final int id;
  final String name;
  const CountyData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CountyDataCompanion toCompanion(bool nullToAbsent) {
    return CountyDataCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory CountyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountyData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CountyData copyWith({int? id, String? name}) => CountyData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CountyData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountyData && other.id == this.id && other.name == this.name);
}

class CountyDataCompanion extends UpdateCompanion<CountyData> {
  final Value<int> id;
  final Value<String> name;
  const CountyDataCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CountyDataCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<CountyData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CountyDataCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CountyDataCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountyDataCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CountiesTable extends Counties
    with TableInfo<$CountiesTable, CountyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountiesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'counties';
  @override
  String get actualTableName => 'counties';
  @override
  VerificationContext validateIntegrity(Insertable<CountyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountyData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CountiesTable createAlias(String alias) {
    return $CountiesTable(attachedDatabase, alias);
  }
}

class CityData extends DataClass implements Insertable<CityData> {
  final int id;
  final String name;
  final int countyId;
  const CityData(
      {required this.id, required this.name, required this.countyId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['county_id'] = Variable<int>(countyId);
    return map;
  }

  CityDataCompanion toCompanion(bool nullToAbsent) {
    return CityDataCompanion(
      id: Value(id),
      name: Value(name),
      countyId: Value(countyId),
    );
  }

  factory CityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      countyId: serializer.fromJson<int>(json['countyId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'countyId': serializer.toJson<int>(countyId),
    };
  }

  CityData copyWith({int? id, String? name, int? countyId}) => CityData(
        id: id ?? this.id,
        name: name ?? this.name,
        countyId: countyId ?? this.countyId,
      );
  @override
  String toString() {
    return (StringBuffer('CityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('countyId: $countyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, countyId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.countyId == this.countyId);
}

class CityDataCompanion extends UpdateCompanion<CityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> countyId;
  const CityDataCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.countyId = const Value.absent(),
  });
  CityDataCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int countyId,
  })  : name = Value(name),
        countyId = Value(countyId);
  static Insertable<CityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? countyId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (countyId != null) 'county_id': countyId,
    });
  }

  CityDataCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? countyId}) {
    return CityDataCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      countyId: countyId ?? this.countyId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (countyId.present) {
      map['county_id'] = Variable<int>(countyId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityDataCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('countyId: $countyId')
          ..write(')'))
        .toString();
  }
}

class $CitiesTable extends Cities with TableInfo<$CitiesTable, CityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CitiesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _countyIdMeta = const VerificationMeta('countyId');
  @override
  late final GeneratedColumn<int> countyId = GeneratedColumn<int>(
      'county_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES counties (id)');
  @override
  List<GeneratedColumn> get $columns => [id, name, countyId];
  @override
  String get aliasedName => _alias ?? 'cities';
  @override
  String get actualTableName => 'cities';
  @override
  VerificationContext validateIntegrity(Insertable<CityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('county_id')) {
      context.handle(_countyIdMeta,
          countyId.isAcceptableOrUnknown(data['county_id']!, _countyIdMeta));
    } else if (isInserting) {
      context.missing(_countyIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CityData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      countyId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}county_id'])!,
    );
  }

  @override
  $CitiesTable createAlias(String alias) {
    return $CitiesTable(attachedDatabase, alias);
  }
}

class NotificationData extends DataClass
    implements Insertable<NotificationData> {
  final int id;
  final String name;
  final AssignmentType assignmentType;
  final int cityId;
  final int? minFloorArea;
  final int? maxFloorArea;
  final int? minPrice;
  final int? maxPrice;
  final bool isEnabled;
  const NotificationData(
      {required this.id,
      required this.name,
      required this.assignmentType,
      required this.cityId,
      this.minFloorArea,
      this.maxFloorArea,
      this.minPrice,
      this.maxPrice,
      required this.isEnabled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      final converter = $NotificationsTable.$converter0;
      map['assignment_type'] = Variable<int>(converter.toSql(assignmentType));
    }
    map['city_id'] = Variable<int>(cityId);
    if (!nullToAbsent || minFloorArea != null) {
      map['min_floor_area'] = Variable<int>(minFloorArea);
    }
    if (!nullToAbsent || maxFloorArea != null) {
      map['max_floor_area'] = Variable<int>(maxFloorArea);
    }
    if (!nullToAbsent || minPrice != null) {
      map['min_price'] = Variable<int>(minPrice);
    }
    if (!nullToAbsent || maxPrice != null) {
      map['max_price'] = Variable<int>(maxPrice);
    }
    map['is_enabled'] = Variable<bool>(isEnabled);
    return map;
  }

  NotificationDataCompanion toCompanion(bool nullToAbsent) {
    return NotificationDataCompanion(
      id: Value(id),
      name: Value(name),
      assignmentType: Value(assignmentType),
      cityId: Value(cityId),
      minFloorArea: minFloorArea == null && nullToAbsent
          ? const Value.absent()
          : Value(minFloorArea),
      maxFloorArea: maxFloorArea == null && nullToAbsent
          ? const Value.absent()
          : Value(maxFloorArea),
      minPrice: minPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(minPrice),
      maxPrice: maxPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(maxPrice),
      isEnabled: Value(isEnabled),
    );
  }

  factory NotificationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      assignmentType:
          serializer.fromJson<AssignmentType>(json['assignmentType']),
      cityId: serializer.fromJson<int>(json['cityId']),
      minFloorArea: serializer.fromJson<int?>(json['minFloorArea']),
      maxFloorArea: serializer.fromJson<int?>(json['maxFloorArea']),
      minPrice: serializer.fromJson<int?>(json['minPrice']),
      maxPrice: serializer.fromJson<int?>(json['maxPrice']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'assignmentType': serializer.toJson<AssignmentType>(assignmentType),
      'cityId': serializer.toJson<int>(cityId),
      'minFloorArea': serializer.toJson<int?>(minFloorArea),
      'maxFloorArea': serializer.toJson<int?>(maxFloorArea),
      'minPrice': serializer.toJson<int?>(minPrice),
      'maxPrice': serializer.toJson<int?>(maxPrice),
      'isEnabled': serializer.toJson<bool>(isEnabled),
    };
  }

  NotificationData copyWith(
          {int? id,
          String? name,
          AssignmentType? assignmentType,
          int? cityId,
          Value<int?> minFloorArea = const Value.absent(),
          Value<int?> maxFloorArea = const Value.absent(),
          Value<int?> minPrice = const Value.absent(),
          Value<int?> maxPrice = const Value.absent(),
          bool? isEnabled}) =>
      NotificationData(
        id: id ?? this.id,
        name: name ?? this.name,
        assignmentType: assignmentType ?? this.assignmentType,
        cityId: cityId ?? this.cityId,
        minFloorArea:
            minFloorArea.present ? minFloorArea.value : this.minFloorArea,
        maxFloorArea:
            maxFloorArea.present ? maxFloorArea.value : this.maxFloorArea,
        minPrice: minPrice.present ? minPrice.value : this.minPrice,
        maxPrice: maxPrice.present ? maxPrice.value : this.maxPrice,
        isEnabled: isEnabled ?? this.isEnabled,
      );
  @override
  String toString() {
    return (StringBuffer('NotificationData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('assignmentType: $assignmentType, ')
          ..write('cityId: $cityId, ')
          ..write('minFloorArea: $minFloorArea, ')
          ..write('maxFloorArea: $maxFloorArea, ')
          ..write('minPrice: $minPrice, ')
          ..write('maxPrice: $maxPrice, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, assignmentType, cityId,
      minFloorArea, maxFloorArea, minPrice, maxPrice, isEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationData &&
          other.id == this.id &&
          other.name == this.name &&
          other.assignmentType == this.assignmentType &&
          other.cityId == this.cityId &&
          other.minFloorArea == this.minFloorArea &&
          other.maxFloorArea == this.maxFloorArea &&
          other.minPrice == this.minPrice &&
          other.maxPrice == this.maxPrice &&
          other.isEnabled == this.isEnabled);
}

class NotificationDataCompanion extends UpdateCompanion<NotificationData> {
  final Value<int> id;
  final Value<String> name;
  final Value<AssignmentType> assignmentType;
  final Value<int> cityId;
  final Value<int?> minFloorArea;
  final Value<int?> maxFloorArea;
  final Value<int?> minPrice;
  final Value<int?> maxPrice;
  final Value<bool> isEnabled;
  const NotificationDataCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.assignmentType = const Value.absent(),
    this.cityId = const Value.absent(),
    this.minFloorArea = const Value.absent(),
    this.maxFloorArea = const Value.absent(),
    this.minPrice = const Value.absent(),
    this.maxPrice = const Value.absent(),
    this.isEnabled = const Value.absent(),
  });
  NotificationDataCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required AssignmentType assignmentType,
    required int cityId,
    this.minFloorArea = const Value.absent(),
    this.maxFloorArea = const Value.absent(),
    this.minPrice = const Value.absent(),
    this.maxPrice = const Value.absent(),
    required bool isEnabled,
  })  : name = Value(name),
        assignmentType = Value(assignmentType),
        cityId = Value(cityId),
        isEnabled = Value(isEnabled);
  static Insertable<NotificationData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? assignmentType,
    Expression<int>? cityId,
    Expression<int>? minFloorArea,
    Expression<int>? maxFloorArea,
    Expression<int>? minPrice,
    Expression<int>? maxPrice,
    Expression<bool>? isEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (assignmentType != null) 'assignment_type': assignmentType,
      if (cityId != null) 'city_id': cityId,
      if (minFloorArea != null) 'min_floor_area': minFloorArea,
      if (maxFloorArea != null) 'max_floor_area': maxFloorArea,
      if (minPrice != null) 'min_price': minPrice,
      if (maxPrice != null) 'max_price': maxPrice,
      if (isEnabled != null) 'is_enabled': isEnabled,
    });
  }

  NotificationDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<AssignmentType>? assignmentType,
      Value<int>? cityId,
      Value<int?>? minFloorArea,
      Value<int?>? maxFloorArea,
      Value<int?>? minPrice,
      Value<int?>? maxPrice,
      Value<bool>? isEnabled}) {
    return NotificationDataCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      assignmentType: assignmentType ?? this.assignmentType,
      cityId: cityId ?? this.cityId,
      minFloorArea: minFloorArea ?? this.minFloorArea,
      maxFloorArea: maxFloorArea ?? this.maxFloorArea,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (assignmentType.present) {
      final converter = $NotificationsTable.$converter0;
      map['assignment_type'] =
          Variable<int>(converter.toSql(assignmentType.value));
    }
    if (cityId.present) {
      map['city_id'] = Variable<int>(cityId.value);
    }
    if (minFloorArea.present) {
      map['min_floor_area'] = Variable<int>(minFloorArea.value);
    }
    if (maxFloorArea.present) {
      map['max_floor_area'] = Variable<int>(maxFloorArea.value);
    }
    if (minPrice.present) {
      map['min_price'] = Variable<int>(minPrice.value);
    }
    if (maxPrice.present) {
      map['max_price'] = Variable<int>(maxPrice.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationDataCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('assignmentType: $assignmentType, ')
          ..write('cityId: $cityId, ')
          ..write('minFloorArea: $minFloorArea, ')
          ..write('maxFloorArea: $maxFloorArea, ')
          ..write('minPrice: $minPrice, ')
          ..write('maxPrice: $maxPrice, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, NotificationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _assignmentTypeMeta =
      const VerificationMeta('assignmentType');
  @override
  late final GeneratedColumnWithTypeConverter<AssignmentType, int>
      assignmentType = GeneratedColumn<int>(
              'assignment_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<AssignmentType>($NotificationsTable.$converter0);
  final VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<int> cityId = GeneratedColumn<int>(
      'city_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES cities (id)');
  final VerificationMeta _minFloorAreaMeta =
      const VerificationMeta('minFloorArea');
  @override
  late final GeneratedColumn<int> minFloorArea = GeneratedColumn<int>(
      'min_floor_area', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _maxFloorAreaMeta =
      const VerificationMeta('maxFloorArea');
  @override
  late final GeneratedColumn<int> maxFloorArea = GeneratedColumn<int>(
      'max_floor_area', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _minPriceMeta = const VerificationMeta('minPrice');
  @override
  late final GeneratedColumn<int> minPrice = GeneratedColumn<int>(
      'min_price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _maxPriceMeta = const VerificationMeta('maxPrice');
  @override
  late final GeneratedColumn<int> maxPrice = GeneratedColumn<int>(
      'max_price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _isEnabledMeta = const VerificationMeta('isEnabled');
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
      'is_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_enabled IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        assignmentType,
        cityId,
        minFloorArea,
        maxFloorArea,
        minPrice,
        maxPrice,
        isEnabled
      ];
  @override
  String get aliasedName => _alias ?? 'notifications';
  @override
  String get actualTableName => 'notifications';
  @override
  VerificationContext validateIntegrity(Insertable<NotificationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_assignmentTypeMeta, const VerificationResult.success());
    if (data.containsKey('city_id')) {
      context.handle(_cityIdMeta,
          cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta));
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('min_floor_area')) {
      context.handle(
          _minFloorAreaMeta,
          minFloorArea.isAcceptableOrUnknown(
              data['min_floor_area']!, _minFloorAreaMeta));
    }
    if (data.containsKey('max_floor_area')) {
      context.handle(
          _maxFloorAreaMeta,
          maxFloorArea.isAcceptableOrUnknown(
              data['max_floor_area']!, _maxFloorAreaMeta));
    }
    if (data.containsKey('min_price')) {
      context.handle(_minPriceMeta,
          minPrice.isAcceptableOrUnknown(data['min_price']!, _minPriceMeta));
    }
    if (data.containsKey('max_price')) {
      context.handle(_maxPriceMeta,
          maxPrice.isAcceptableOrUnknown(data['max_price']!, _maxPriceMeta));
    }
    if (data.containsKey('is_enabled')) {
      context.handle(_isEnabledMeta,
          isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta));
    } else if (isInserting) {
      context.missing(_isEnabledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      assignmentType: $NotificationsTable.$converter0.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}assignment_type'])!),
      cityId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}city_id'])!,
      minFloorArea: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}min_floor_area']),
      maxFloorArea: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}max_floor_area']),
      minPrice: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}min_price']),
      maxPrice: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}max_price']),
      isEnabled: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_enabled'])!,
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }

  static TypeConverter<AssignmentType, int> $converter0 =
      const EnumIndexConverter<AssignmentType>(AssignmentType.values);
}

class NotificationEstateTypesModel extends DataClass
    implements Insertable<NotificationEstateTypesModel> {
  final int notificationId;
  final EstateType estateType;
  const NotificationEstateTypesModel(
      {required this.notificationId, required this.estateType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['notification_id'] = Variable<int>(notificationId);
    {
      final converter = $NotificationEstateTypesTable.$converter0;
      map['estate_type'] = Variable<int>(converter.toSql(estateType));
    }
    return map;
  }

  NotificationEstateTypesModelCompanion toCompanion(bool nullToAbsent) {
    return NotificationEstateTypesModelCompanion(
      notificationId: Value(notificationId),
      estateType: Value(estateType),
    );
  }

  factory NotificationEstateTypesModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationEstateTypesModel(
      notificationId: serializer.fromJson<int>(json['notificationId']),
      estateType: serializer.fromJson<EstateType>(json['estateType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'notificationId': serializer.toJson<int>(notificationId),
      'estateType': serializer.toJson<EstateType>(estateType),
    };
  }

  NotificationEstateTypesModel copyWith(
          {int? notificationId, EstateType? estateType}) =>
      NotificationEstateTypesModel(
        notificationId: notificationId ?? this.notificationId,
        estateType: estateType ?? this.estateType,
      );
  @override
  String toString() {
    return (StringBuffer('NotificationEstateTypesModel(')
          ..write('notificationId: $notificationId, ')
          ..write('estateType: $estateType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(notificationId, estateType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationEstateTypesModel &&
          other.notificationId == this.notificationId &&
          other.estateType == this.estateType);
}

class NotificationEstateTypesModelCompanion
    extends UpdateCompanion<NotificationEstateTypesModel> {
  final Value<int> notificationId;
  final Value<EstateType> estateType;
  const NotificationEstateTypesModelCompanion({
    this.notificationId = const Value.absent(),
    this.estateType = const Value.absent(),
  });
  NotificationEstateTypesModelCompanion.insert({
    required int notificationId,
    required EstateType estateType,
  })  : notificationId = Value(notificationId),
        estateType = Value(estateType);
  static Insertable<NotificationEstateTypesModel> custom({
    Expression<int>? notificationId,
    Expression<int>? estateType,
  }) {
    return RawValuesInsertable({
      if (notificationId != null) 'notification_id': notificationId,
      if (estateType != null) 'estate_type': estateType,
    });
  }

  NotificationEstateTypesModelCompanion copyWith(
      {Value<int>? notificationId, Value<EstateType>? estateType}) {
    return NotificationEstateTypesModelCompanion(
      notificationId: notificationId ?? this.notificationId,
      estateType: estateType ?? this.estateType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (estateType.present) {
      final converter = $NotificationEstateTypesTable.$converter0;
      map['estate_type'] = Variable<int>(converter.toSql(estateType.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationEstateTypesModelCompanion(')
          ..write('notificationId: $notificationId, ')
          ..write('estateType: $estateType')
          ..write(')'))
        .toString();
  }
}

class $NotificationEstateTypesTable extends NotificationEstateTypes
    with
        TableInfo<$NotificationEstateTypesTable, NotificationEstateTypesModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationEstateTypesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _notificationIdMeta =
      const VerificationMeta('notificationId');
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
      'notification_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES notifications (id)');
  final VerificationMeta _estateTypeMeta = const VerificationMeta('estateType');
  @override
  late final GeneratedColumnWithTypeConverter<EstateType, int> estateType =
      GeneratedColumn<int>('estate_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<EstateType>($NotificationEstateTypesTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [notificationId, estateType];
  @override
  String get aliasedName => _alias ?? 'notification_estate_types';
  @override
  String get actualTableName => 'notification_estate_types';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationEstateTypesModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('notification_id')) {
      context.handle(
          _notificationIdMeta,
          notificationId.isAcceptableOrUnknown(
              data['notification_id']!, _notificationIdMeta));
    } else if (isInserting) {
      context.missing(_notificationIdMeta);
    }
    context.handle(_estateTypeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {notificationId, estateType};
  @override
  NotificationEstateTypesModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationEstateTypesModel(
      notificationId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}notification_id'])!,
      estateType: $NotificationEstateTypesTable.$converter0.fromSql(
          attachedDatabase.options.types
              .read(DriftSqlType.int, data['${effectivePrefix}estate_type'])!),
    );
  }

  @override
  $NotificationEstateTypesTable createAlias(String alias) {
    return $NotificationEstateTypesTable(attachedDatabase, alias);
  }

  static TypeConverter<EstateType, int> $converter0 =
      const EnumIndexConverter<EstateType>(EstateType.values);
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $CountiesTable counties = $CountiesTable(this);
  late final $CitiesTable cities = $CitiesTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $NotificationEstateTypesTable notificationEstateTypes =
      $NotificationEstateTypesTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [counties, cities, notifications, notificationEstateTypes];
}
