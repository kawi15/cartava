// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PolylinesTable extends Polylines
    with TableInfo<$PolylinesTable, Polyline> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PolylinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'polylines';
  @override
  VerificationContext validateIntegrity(
    Insertable<Polyline> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Polyline map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Polyline(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $PolylinesTable createAlias(String alias) {
    return $PolylinesTable(attachedDatabase, alias);
  }
}

class Polyline extends DataClass implements Insertable<Polyline> {
  final int id;
  const Polyline({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  PolylinesCompanion toCompanion(bool nullToAbsent) {
    return PolylinesCompanion(id: Value(id));
  }

  factory Polyline.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Polyline(id: serializer.fromJson<int>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<int>(id)};
  }

  Polyline copyWith({int? id}) => Polyline(id: id ?? this.id);
  Polyline copyWithCompanion(PolylinesCompanion data) {
    return Polyline(id: data.id.present ? data.id.value : this.id);
  }

  @override
  String toString() {
    return (StringBuffer('Polyline(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Polyline && other.id == this.id);
}

class PolylinesCompanion extends UpdateCompanion<Polyline> {
  final Value<int> id;
  final Value<int> rowid;
  const PolylinesCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PolylinesCompanion.insert({
    required int id,
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Polyline> custom({
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PolylinesCompanion copyWith({Value<int>? id, Value<int>? rowid}) {
    return PolylinesCompanion(id: id ?? this.id, rowid: rowid ?? this.rowid);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PolylinesCompanion(')
          ..write('id: $id, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StravaActivitiesTable extends StravaActivities
    with TableInfo<$StravaActivitiesTable, StravaActivity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StravaActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isVisibleMeta = const VerificationMeta(
    'isVisible',
  );
  @override
  late final GeneratedColumn<bool> isVisible = GeneratedColumn<bool>(
    'is_visible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_visible" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _polylineIdMeta = const VerificationMeta(
    'polylineId',
  );
  @override
  late final GeneratedColumn<int> polylineId = GeneratedColumn<int>(
    'polyline_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES polylines (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    distance,
    date,
    isVisible,
    polylineId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'strava_activities';
  @override
  VerificationContext validateIntegrity(
    Insertable<StravaActivity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['start_date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_visible')) {
      context.handle(
        _isVisibleMeta,
        isVisible.isAcceptableOrUnknown(data['is_visible']!, _isVisibleMeta),
      );
    }
    if (data.containsKey('polyline_id')) {
      context.handle(
        _polylineIdMeta,
        polylineId.isAcceptableOrUnknown(data['polyline_id']!, _polylineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_polylineIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StravaActivity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StravaActivity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      isVisible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_visible'],
      )!,
      polylineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}polyline_id'],
      )!,
    );
  }

  @override
  $StravaActivitiesTable createAlias(String alias) {
    return $StravaActivitiesTable(attachedDatabase, alias);
  }
}

class StravaActivity extends DataClass implements Insertable<StravaActivity> {
  final int id;
  final String name;
  final double distance;
  final DateTime date;
  final bool isVisible;
  final int polylineId;
  const StravaActivity({
    required this.id,
    required this.name,
    required this.distance,
    required this.date,
    required this.isVisible,
    required this.polylineId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['distance'] = Variable<double>(distance);
    map['start_date'] = Variable<DateTime>(date);
    map['is_visible'] = Variable<bool>(isVisible);
    map['polyline_id'] = Variable<int>(polylineId);
    return map;
  }

  StravaActivitiesCompanion toCompanion(bool nullToAbsent) {
    return StravaActivitiesCompanion(
      id: Value(id),
      name: Value(name),
      distance: Value(distance),
      date: Value(date),
      isVisible: Value(isVisible),
      polylineId: Value(polylineId),
    );
  }

  factory StravaActivity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StravaActivity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      distance: serializer.fromJson<double>(json['distance']),
      date: serializer.fromJson<DateTime>(json['date']),
      isVisible: serializer.fromJson<bool>(json['isVisible']),
      polylineId: serializer.fromJson<int>(json['polylineId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'distance': serializer.toJson<double>(distance),
      'date': serializer.toJson<DateTime>(date),
      'isVisible': serializer.toJson<bool>(isVisible),
      'polylineId': serializer.toJson<int>(polylineId),
    };
  }

  StravaActivity copyWith({
    int? id,
    String? name,
    double? distance,
    DateTime? date,
    bool? isVisible,
    int? polylineId,
  }) => StravaActivity(
    id: id ?? this.id,
    name: name ?? this.name,
    distance: distance ?? this.distance,
    date: date ?? this.date,
    isVisible: isVisible ?? this.isVisible,
    polylineId: polylineId ?? this.polylineId,
  );
  StravaActivity copyWithCompanion(StravaActivitiesCompanion data) {
    return StravaActivity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      distance: data.distance.present ? data.distance.value : this.distance,
      date: data.date.present ? data.date.value : this.date,
      isVisible: data.isVisible.present ? data.isVisible.value : this.isVisible,
      polylineId: data.polylineId.present
          ? data.polylineId.value
          : this.polylineId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StravaActivity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('distance: $distance, ')
          ..write('date: $date, ')
          ..write('isVisible: $isVisible, ')
          ..write('polylineId: $polylineId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, distance, date, isVisible, polylineId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StravaActivity &&
          other.id == this.id &&
          other.name == this.name &&
          other.distance == this.distance &&
          other.date == this.date &&
          other.isVisible == this.isVisible &&
          other.polylineId == this.polylineId);
}

class StravaActivitiesCompanion extends UpdateCompanion<StravaActivity> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> distance;
  final Value<DateTime> date;
  final Value<bool> isVisible;
  final Value<int> polylineId;
  final Value<int> rowid;
  const StravaActivitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.distance = const Value.absent(),
    this.date = const Value.absent(),
    this.isVisible = const Value.absent(),
    this.polylineId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StravaActivitiesCompanion.insert({
    required int id,
    required String name,
    required double distance,
    required DateTime date,
    this.isVisible = const Value.absent(),
    required int polylineId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       distance = Value(distance),
       date = Value(date),
       polylineId = Value(polylineId);
  static Insertable<StravaActivity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? distance,
    Expression<DateTime>? date,
    Expression<bool>? isVisible,
    Expression<int>? polylineId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (distance != null) 'distance': distance,
      if (date != null) 'start_date': date,
      if (isVisible != null) 'is_visible': isVisible,
      if (polylineId != null) 'polyline_id': polylineId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StravaActivitiesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? distance,
    Value<DateTime>? date,
    Value<bool>? isVisible,
    Value<int>? polylineId,
    Value<int>? rowid,
  }) {
    return StravaActivitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      distance: distance ?? this.distance,
      date: date ?? this.date,
      isVisible: isVisible ?? this.isVisible,
      polylineId: polylineId ?? this.polylineId,
      rowid: rowid ?? this.rowid,
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
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (date.present) {
      map['start_date'] = Variable<DateTime>(date.value);
    }
    if (isVisible.present) {
      map['is_visible'] = Variable<bool>(isVisible.value);
    }
    if (polylineId.present) {
      map['polyline_id'] = Variable<int>(polylineId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StravaActivitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('distance: $distance, ')
          ..write('date: $date, ')
          ..write('isVisible: $isVisible, ')
          ..write('polylineId: $polylineId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PolylinePointsTable extends PolylinePoints
    with TableInfo<$PolylinePointsTable, PolylinePoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PolylinePointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _polylineIdMeta = const VerificationMeta(
    'polylineId',
  );
  @override
  late final GeneratedColumn<int> polylineId = GeneratedColumn<int>(
    'polyline_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES polylines (id)',
    ),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, polylineId, lat, lng];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'polyline_points';
  @override
  VerificationContext validateIntegrity(
    Insertable<PolylinePoint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('polyline_id')) {
      context.handle(
        _polylineIdMeta,
        polylineId.isAcceptableOrUnknown(data['polyline_id']!, _polylineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_polylineIdMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PolylinePoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PolylinePoint(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      polylineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}polyline_id'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
    );
  }

  @override
  $PolylinePointsTable createAlias(String alias) {
    return $PolylinePointsTable(attachedDatabase, alias);
  }
}

class PolylinePoint extends DataClass implements Insertable<PolylinePoint> {
  final int id;
  final int polylineId;
  final double lat;
  final double lng;
  const PolylinePoint({
    required this.id,
    required this.polylineId,
    required this.lat,
    required this.lng,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['polyline_id'] = Variable<int>(polylineId);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    return map;
  }

  PolylinePointsCompanion toCompanion(bool nullToAbsent) {
    return PolylinePointsCompanion(
      id: Value(id),
      polylineId: Value(polylineId),
      lat: Value(lat),
      lng: Value(lng),
    );
  }

  factory PolylinePoint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PolylinePoint(
      id: serializer.fromJson<int>(json['id']),
      polylineId: serializer.fromJson<int>(json['polylineId']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'polylineId': serializer.toJson<int>(polylineId),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
    };
  }

  PolylinePoint copyWith({
    int? id,
    int? polylineId,
    double? lat,
    double? lng,
  }) => PolylinePoint(
    id: id ?? this.id,
    polylineId: polylineId ?? this.polylineId,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
  );
  PolylinePoint copyWithCompanion(PolylinePointsCompanion data) {
    return PolylinePoint(
      id: data.id.present ? data.id.value : this.id,
      polylineId: data.polylineId.present
          ? data.polylineId.value
          : this.polylineId,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PolylinePoint(')
          ..write('id: $id, ')
          ..write('polylineId: $polylineId, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, polylineId, lat, lng);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PolylinePoint &&
          other.id == this.id &&
          other.polylineId == this.polylineId &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class PolylinePointsCompanion extends UpdateCompanion<PolylinePoint> {
  final Value<int> id;
  final Value<int> polylineId;
  final Value<double> lat;
  final Value<double> lng;
  const PolylinePointsCompanion({
    this.id = const Value.absent(),
    this.polylineId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
  });
  PolylinePointsCompanion.insert({
    this.id = const Value.absent(),
    required int polylineId,
    required double lat,
    required double lng,
  }) : polylineId = Value(polylineId),
       lat = Value(lat),
       lng = Value(lng);
  static Insertable<PolylinePoint> custom({
    Expression<int>? id,
    Expression<int>? polylineId,
    Expression<double>? lat,
    Expression<double>? lng,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (polylineId != null) 'polyline_id': polylineId,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
    });
  }

  PolylinePointsCompanion copyWith({
    Value<int>? id,
    Value<int>? polylineId,
    Value<double>? lat,
    Value<double>? lng,
  }) {
    return PolylinePointsCompanion(
      id: id ?? this.id,
      polylineId: polylineId ?? this.polylineId,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (polylineId.present) {
      map['polyline_id'] = Variable<int>(polylineId.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PolylinePointsCompanion(')
          ..write('id: $id, ')
          ..write('polylineId: $polylineId, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PolylinesTable polylines = $PolylinesTable(this);
  late final $StravaActivitiesTable stravaActivities = $StravaActivitiesTable(
    this,
  );
  late final $PolylinePointsTable polylinePoints = $PolylinePointsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    polylines,
    stravaActivities,
    polylinePoints,
  ];
}

typedef $$PolylinesTableCreateCompanionBuilder =
    PolylinesCompanion Function({required int id, Value<int> rowid});
typedef $$PolylinesTableUpdateCompanionBuilder =
    PolylinesCompanion Function({Value<int> id, Value<int> rowid});

final class $$PolylinesTableReferences
    extends BaseReferences<_$AppDatabase, $PolylinesTable, Polyline> {
  $$PolylinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StravaActivitiesTable, List<StravaActivity>>
  _stravaActivitiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.stravaActivities,
    aliasName: $_aliasNameGenerator(
      db.polylines.id,
      db.stravaActivities.polylineId,
    ),
  );

  $$StravaActivitiesTableProcessedTableManager get stravaActivitiesRefs {
    final manager = $$StravaActivitiesTableTableManager(
      $_db,
      $_db.stravaActivities,
    ).filter((f) => f.polylineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _stravaActivitiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PolylinePointsTable, List<PolylinePoint>>
  _polylinePointsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.polylinePoints,
    aliasName: $_aliasNameGenerator(
      db.polylines.id,
      db.polylinePoints.polylineId,
    ),
  );

  $$PolylinePointsTableProcessedTableManager get polylinePointsRefs {
    final manager = $$PolylinePointsTableTableManager(
      $_db,
      $_db.polylinePoints,
    ).filter((f) => f.polylineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_polylinePointsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PolylinesTableFilterComposer
    extends Composer<_$AppDatabase, $PolylinesTable> {
  $$PolylinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> stravaActivitiesRefs(
    Expression<bool> Function($$StravaActivitiesTableFilterComposer f) f,
  ) {
    final $$StravaActivitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.stravaActivities,
      getReferencedColumn: (t) => t.polylineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StravaActivitiesTableFilterComposer(
            $db: $db,
            $table: $db.stravaActivities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> polylinePointsRefs(
    Expression<bool> Function($$PolylinePointsTableFilterComposer f) f,
  ) {
    final $$PolylinePointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.polylinePoints,
      getReferencedColumn: (t) => t.polylineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolylinePointsTableFilterComposer(
            $db: $db,
            $table: $db.polylinePoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PolylinesTableOrderingComposer
    extends Composer<_$AppDatabase, $PolylinesTable> {
  $$PolylinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PolylinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PolylinesTable> {
  $$PolylinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  Expression<T> stravaActivitiesRefs<T extends Object>(
    Expression<T> Function($$StravaActivitiesTableAnnotationComposer a) f,
  ) {
    final $$StravaActivitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.stravaActivities,
      getReferencedColumn: (t) => t.polylineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StravaActivitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.stravaActivities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> polylinePointsRefs<T extends Object>(
    Expression<T> Function($$PolylinePointsTableAnnotationComposer a) f,
  ) {
    final $$PolylinePointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.polylinePoints,
      getReferencedColumn: (t) => t.polylineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolylinePointsTableAnnotationComposer(
            $db: $db,
            $table: $db.polylinePoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PolylinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PolylinesTable,
          Polyline,
          $$PolylinesTableFilterComposer,
          $$PolylinesTableOrderingComposer,
          $$PolylinesTableAnnotationComposer,
          $$PolylinesTableCreateCompanionBuilder,
          $$PolylinesTableUpdateCompanionBuilder,
          (Polyline, $$PolylinesTableReferences),
          Polyline,
          PrefetchHooks Function({
            bool stravaActivitiesRefs,
            bool polylinePointsRefs,
          })
        > {
  $$PolylinesTableTableManager(_$AppDatabase db, $PolylinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PolylinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PolylinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PolylinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PolylinesCompanion(id: id, rowid: rowid),
          createCompanionCallback:
              ({required int id, Value<int> rowid = const Value.absent()}) =>
                  PolylinesCompanion.insert(id: id, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PolylinesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({stravaActivitiesRefs = false, polylinePointsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (stravaActivitiesRefs) db.stravaActivities,
                    if (polylinePointsRefs) db.polylinePoints,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (stravaActivitiesRefs)
                        await $_getPrefetchedData<
                          Polyline,
                          $PolylinesTable,
                          StravaActivity
                        >(
                          currentTable: table,
                          referencedTable: $$PolylinesTableReferences
                              ._stravaActivitiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PolylinesTableReferences(
                                db,
                                table,
                                p0,
                              ).stravaActivitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.polylineId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (polylinePointsRefs)
                        await $_getPrefetchedData<
                          Polyline,
                          $PolylinesTable,
                          PolylinePoint
                        >(
                          currentTable: table,
                          referencedTable: $$PolylinesTableReferences
                              ._polylinePointsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PolylinesTableReferences(
                                db,
                                table,
                                p0,
                              ).polylinePointsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.polylineId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PolylinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PolylinesTable,
      Polyline,
      $$PolylinesTableFilterComposer,
      $$PolylinesTableOrderingComposer,
      $$PolylinesTableAnnotationComposer,
      $$PolylinesTableCreateCompanionBuilder,
      $$PolylinesTableUpdateCompanionBuilder,
      (Polyline, $$PolylinesTableReferences),
      Polyline,
      PrefetchHooks Function({
        bool stravaActivitiesRefs,
        bool polylinePointsRefs,
      })
    >;
typedef $$StravaActivitiesTableCreateCompanionBuilder =
    StravaActivitiesCompanion Function({
      required int id,
      required String name,
      required double distance,
      required DateTime date,
      Value<bool> isVisible,
      required int polylineId,
      Value<int> rowid,
    });
typedef $$StravaActivitiesTableUpdateCompanionBuilder =
    StravaActivitiesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> distance,
      Value<DateTime> date,
      Value<bool> isVisible,
      Value<int> polylineId,
      Value<int> rowid,
    });

final class $$StravaActivitiesTableReferences
    extends
        BaseReferences<_$AppDatabase, $StravaActivitiesTable, StravaActivity> {
  $$StravaActivitiesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PolylinesTable _polylineIdTable(_$AppDatabase db) =>
      db.polylines.createAlias(
        $_aliasNameGenerator(db.stravaActivities.polylineId, db.polylines.id),
      );

  $$PolylinesTableProcessedTableManager get polylineId {
    final $_column = $_itemColumn<int>('polyline_id')!;

    final manager = $$PolylinesTableTableManager(
      $_db,
      $_db.polylines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_polylineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StravaActivitiesTableFilterComposer
    extends Composer<_$AppDatabase, $StravaActivitiesTable> {
  $$StravaActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVisible => $composableBuilder(
    column: $table.isVisible,
    builder: (column) => ColumnFilters(column),
  );

  $$PolylinesTableFilterComposer get polylineId {
    final $$PolylinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polylineId,
      referencedTable: $db.polylines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolylinesTableFilterComposer(
            $db: $db,
            $table: $db.polylines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StravaActivitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $StravaActivitiesTable> {
  $$StravaActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVisible => $composableBuilder(
    column: $table.isVisible,
    builder: (column) => ColumnOrderings(column),
  );

  $$PolylinesTableOrderingComposer get polylineId {
    final $$PolylinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polylineId,
      referencedTable: $db.polylines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolylinesTableOrderingComposer(
            $db: $db,
            $table: $db.polylines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StravaActivitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StravaActivitiesTable> {
  $$StravaActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isVisible =>
      $composableBuilder(column: $table.isVisible, builder: (column) => column);

  $$PolylinesTableAnnotationComposer get polylineId {
    final $$PolylinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polylineId,
      referencedTable: $db.polylines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolylinesTableAnnotationComposer(
            $db: $db,
            $table: $db.polylines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StravaActivitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StravaActivitiesTable,
          StravaActivity,
          $$StravaActivitiesTableFilterComposer,
          $$StravaActivitiesTableOrderingComposer,
          $$StravaActivitiesTableAnnotationComposer,
          $$StravaActivitiesTableCreateCompanionBuilder,
          $$StravaActivitiesTableUpdateCompanionBuilder,
          (StravaActivity, $$StravaActivitiesTableReferences),
          StravaActivity,
          PrefetchHooks Function({bool polylineId})
        > {
  $$StravaActivitiesTableTableManager(
    _$AppDatabase db,
    $StravaActivitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StravaActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StravaActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StravaActivitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> distance = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<bool> isVisible = const Value.absent(),
                Value<int> polylineId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StravaActivitiesCompanion(
                id: id,
                name: name,
                distance: distance,
                date: date,
                isVisible: isVisible,
                polylineId: polylineId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String name,
                required double distance,
                required DateTime date,
                Value<bool> isVisible = const Value.absent(),
                required int polylineId,
                Value<int> rowid = const Value.absent(),
              }) => StravaActivitiesCompanion.insert(
                id: id,
                name: name,
                distance: distance,
                date: date,
                isVisible: isVisible,
                polylineId: polylineId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StravaActivitiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({polylineId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (polylineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.polylineId,
                                referencedTable:
                                    $$StravaActivitiesTableReferences
                                        ._polylineIdTable(db),
                                referencedColumn:
                                    $$StravaActivitiesTableReferences
                                        ._polylineIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StravaActivitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StravaActivitiesTable,
      StravaActivity,
      $$StravaActivitiesTableFilterComposer,
      $$StravaActivitiesTableOrderingComposer,
      $$StravaActivitiesTableAnnotationComposer,
      $$StravaActivitiesTableCreateCompanionBuilder,
      $$StravaActivitiesTableUpdateCompanionBuilder,
      (StravaActivity, $$StravaActivitiesTableReferences),
      StravaActivity,
      PrefetchHooks Function({bool polylineId})
    >;
typedef $$PolylinePointsTableCreateCompanionBuilder =
    PolylinePointsCompanion Function({
      Value<int> id,
      required int polylineId,
      required double lat,
      required double lng,
    });
typedef $$PolylinePointsTableUpdateCompanionBuilder =
    PolylinePointsCompanion Function({
      Value<int> id,
      Value<int> polylineId,
      Value<double> lat,
      Value<double> lng,
    });

final class $$PolylinePointsTableReferences
    extends BaseReferences<_$AppDatabase, $PolylinePointsTable, PolylinePoint> {
  $$PolylinePointsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PolylinesTable _polylineIdTable(_$AppDatabase db) =>
      db.polylines.createAlias(
        $_aliasNameGenerator(db.polylinePoints.polylineId, db.polylines.id),
      );

  $$PolylinesTableProcessedTableManager get polylineId {
    final $_column = $_itemColumn<int>('polyline_id')!;

    final manager = $$PolylinesTableTableManager(
      $_db,
      $_db.polylines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_polylineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PolylinePointsTableFilterComposer
    extends Composer<_$AppDatabase, $PolylinePointsTable> {
  $$PolylinePointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  $$PolylinesTableFilterComposer get polylineId {
    final $$PolylinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polylineId,
      referencedTable: $db.polylines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolylinesTableFilterComposer(
            $db: $db,
            $table: $db.polylines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PolylinePointsTableOrderingComposer
    extends Composer<_$AppDatabase, $PolylinePointsTable> {
  $$PolylinePointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  $$PolylinesTableOrderingComposer get polylineId {
    final $$PolylinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polylineId,
      referencedTable: $db.polylines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolylinesTableOrderingComposer(
            $db: $db,
            $table: $db.polylines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PolylinePointsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PolylinePointsTable> {
  $$PolylinePointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  $$PolylinesTableAnnotationComposer get polylineId {
    final $$PolylinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polylineId,
      referencedTable: $db.polylines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolylinesTableAnnotationComposer(
            $db: $db,
            $table: $db.polylines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PolylinePointsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PolylinePointsTable,
          PolylinePoint,
          $$PolylinePointsTableFilterComposer,
          $$PolylinePointsTableOrderingComposer,
          $$PolylinePointsTableAnnotationComposer,
          $$PolylinePointsTableCreateCompanionBuilder,
          $$PolylinePointsTableUpdateCompanionBuilder,
          (PolylinePoint, $$PolylinePointsTableReferences),
          PolylinePoint,
          PrefetchHooks Function({bool polylineId})
        > {
  $$PolylinePointsTableTableManager(
    _$AppDatabase db,
    $PolylinePointsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PolylinePointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PolylinePointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PolylinePointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> polylineId = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
              }) => PolylinePointsCompanion(
                id: id,
                polylineId: polylineId,
                lat: lat,
                lng: lng,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int polylineId,
                required double lat,
                required double lng,
              }) => PolylinePointsCompanion.insert(
                id: id,
                polylineId: polylineId,
                lat: lat,
                lng: lng,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PolylinePointsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({polylineId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (polylineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.polylineId,
                                referencedTable: $$PolylinePointsTableReferences
                                    ._polylineIdTable(db),
                                referencedColumn:
                                    $$PolylinePointsTableReferences
                                        ._polylineIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PolylinePointsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PolylinePointsTable,
      PolylinePoint,
      $$PolylinePointsTableFilterComposer,
      $$PolylinePointsTableOrderingComposer,
      $$PolylinePointsTableAnnotationComposer,
      $$PolylinePointsTableCreateCompanionBuilder,
      $$PolylinePointsTableUpdateCompanionBuilder,
      (PolylinePoint, $$PolylinePointsTableReferences),
      PolylinePoint,
      PrefetchHooks Function({bool polylineId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PolylinesTableTableManager get polylines =>
      $$PolylinesTableTableManager(_db, _db.polylines);
  $$StravaActivitiesTableTableManager get stravaActivities =>
      $$StravaActivitiesTableTableManager(_db, _db.stravaActivities);
  $$PolylinePointsTableTableManager get polylinePoints =>
      $$PolylinePointsTableTableManager(_db, _db.polylinePoints);
}
