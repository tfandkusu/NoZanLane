// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_zan_lane_database.dart';

// ignore_for_file: type=lint
class $CycleTable extends Cycle with TableInfo<$CycleTable, CycleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CycleTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<int> startAt = GeneratedColumn<int>(
    'start_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<int> endAt = GeneratedColumn<int>(
    'end_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    startAt,
    endAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cycles';
  @override
  VerificationContext validateIntegrity(
    Insertable<CycleData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
        _endAtMeta,
        endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta),
      );
    } else if (isInserting) {
      context.missing(_endAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CycleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CycleData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_at'],
      )!,
      endAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_at'],
      )!,
    );
  }

  @override
  $CycleTable createAlias(String alias) {
    return $CycleTable(attachedDatabase, alias);
  }
}

class CycleData extends DataClass implements Insertable<CycleData> {
  /// プライマリーID。
  final int id;

  /// 作成日時（UNIX ミリ秒）。
  final int createdAt;

  /// 更新日時（UNIX ミリ秒）。
  final int updatedAt;

  /// サイクル開始日時（UNIX ミリ秒）。
  final int startAt;

  /// サイクル終了日時（UNIX ミリ秒）。
  final int endAt;
  const CycleData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.startAt,
    required this.endAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['start_at'] = Variable<int>(startAt);
    map['end_at'] = Variable<int>(endAt);
    return map;
  }

  CycleCompanion toCompanion(bool nullToAbsent) {
    return CycleCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      startAt: Value(startAt),
      endAt: Value(endAt),
    );
  }

  factory CycleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CycleData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      startAt: serializer.fromJson<int>(json['startAt']),
      endAt: serializer.fromJson<int>(json['endAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'startAt': serializer.toJson<int>(startAt),
      'endAt': serializer.toJson<int>(endAt),
    };
  }

  CycleData copyWith({
    int? id,
    int? createdAt,
    int? updatedAt,
    int? startAt,
    int? endAt,
  }) => CycleData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    startAt: startAt ?? this.startAt,
    endAt: endAt ?? this.endAt,
  );
  CycleData copyWithCompanion(CycleCompanion data) {
    return CycleData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CycleData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, startAt, endAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CycleData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.startAt == this.startAt &&
          other.endAt == this.endAt);
}

class CycleCompanion extends UpdateCompanion<CycleData> {
  final Value<int> id;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> startAt;
  final Value<int> endAt;
  const CycleCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.startAt = const Value.absent(),
    this.endAt = const Value.absent(),
  });
  CycleCompanion.insert({
    this.id = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    required int startAt,
    required int endAt,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       startAt = Value(startAt),
       endAt = Value(endAt);
  static Insertable<CycleData> custom({
    Expression<int>? id,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? startAt,
    Expression<int>? endAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (startAt != null) 'start_at': startAt,
      if (endAt != null) 'end_at': endAt,
    });
  }

  CycleCompanion copyWith({
    Value<int>? id,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? startAt,
    Value<int>? endAt,
  }) {
    return CycleCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<int>(startAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<int>(endAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CycleCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }
}

class $StatusTable extends Status with TableInfo<$StatusTable, StatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, label, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'statuses';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatusData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatusData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
    );
  }

  @override
  $StatusTable createAlias(String alias) {
    return $StatusTable(attachedDatabase, alias);
  }
}

class StatusData extends DataClass implements Insertable<StatusData> {
  /// ステータスID。
  final int id;

  /// 表示ラベル。
  final String label;

  /// 表示色（0xRRGGBB）。
  final int color;
  const StatusData({
    required this.id,
    required this.label,
    required this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['color'] = Variable<int>(color);
    return map;
  }

  StatusCompanion toCompanion(bool nullToAbsent) {
    return StatusCompanion(
      id: Value(id),
      label: Value(label),
      color: Value(color),
    );
  }

  factory StatusData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatusData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'color': serializer.toJson<int>(color),
    };
  }

  StatusData copyWith({int? id, String? label, int? color}) => StatusData(
    id: id ?? this.id,
    label: label ?? this.label,
    color: color ?? this.color,
  );
  StatusData copyWithCompanion(StatusCompanion data) {
    return StatusData(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatusData(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatusData &&
          other.id == this.id &&
          other.label == this.label &&
          other.color == this.color);
}

class StatusCompanion extends UpdateCompanion<StatusData> {
  final Value<int> id;
  final Value<String> label;
  final Value<int> color;
  const StatusCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.color = const Value.absent(),
  });
  StatusCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required int color,
  }) : label = Value(label),
       color = Value(color);
  static Insertable<StatusData> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<int>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (color != null) 'color': color,
    });
  }

  StatusCompanion copyWith({
    Value<int>? id,
    Value<String>? label,
    Value<int>? color,
  }) {
    return StatusCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatusCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $IssueTable extends Issue with TableInfo<$IssueTable, IssueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IssueTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<int> point = GeneratedColumn<int>(
    'point',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<int> cycleId = GeneratedColumn<int>(
    'cycle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cycles (id)',
    ),
  );
  static const VerificationMeta _statusIdMeta = const VerificationMeta(
    'statusId',
  );
  @override
  late final GeneratedColumn<int> statusId = GeneratedColumn<int>(
    'status_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES statuses (id)',
    ),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    body,
    point,
    cycleId,
    statusId,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'issues';
  @override
  VerificationContext validateIntegrity(
    Insertable<IssueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('point')) {
      context.handle(
        _pointMeta,
        point.isAcceptableOrUnknown(data['point']!, _pointMeta),
      );
    } else if (isInserting) {
      context.missing(_pointMeta);
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cycleIdMeta);
    }
    if (data.containsKey('status_id')) {
      context.handle(
        _statusIdMeta,
        statusId.isAcceptableOrUnknown(data['status_id']!, _statusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_statusIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IssueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IssueData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      point: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}point'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_id'],
      )!,
      statusId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_id'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $IssueTable createAlias(String alias) {
    return $IssueTable(attachedDatabase, alias);
  }
}

class IssueData extends DataClass implements Insertable<IssueData> {
  /// プライマリーID。
  final int id;

  /// タイトル。
  final String title;

  /// 本文。
  final String body;

  /// 相対ポイント。
  final int point;

  /// サイクルID（cycles テーブルへの参照）。
  final int cycleId;

  /// ステータスID（statuses テーブルへの参照）。
  final int statusId;

  /// 並び順（同じ cycleId, statusId 内での表示順。1 始まり。）。
  final int sortOrder;
  const IssueData({
    required this.id,
    required this.title,
    required this.body,
    required this.point,
    required this.cycleId,
    required this.statusId,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['point'] = Variable<int>(point);
    map['cycle_id'] = Variable<int>(cycleId);
    map['status_id'] = Variable<int>(statusId);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  IssueCompanion toCompanion(bool nullToAbsent) {
    return IssueCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      point: Value(point),
      cycleId: Value(cycleId),
      statusId: Value(statusId),
      sortOrder: Value(sortOrder),
    );
  }

  factory IssueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IssueData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      point: serializer.fromJson<int>(json['point']),
      cycleId: serializer.fromJson<int>(json['cycleId']),
      statusId: serializer.fromJson<int>(json['statusId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'point': serializer.toJson<int>(point),
      'cycleId': serializer.toJson<int>(cycleId),
      'statusId': serializer.toJson<int>(statusId),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  IssueData copyWith({
    int? id,
    String? title,
    String? body,
    int? point,
    int? cycleId,
    int? statusId,
    int? sortOrder,
  }) => IssueData(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    point: point ?? this.point,
    cycleId: cycleId ?? this.cycleId,
    statusId: statusId ?? this.statusId,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  IssueData copyWithCompanion(IssueCompanion data) {
    return IssueData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      point: data.point.present ? data.point.value : this.point,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      statusId: data.statusId.present ? data.statusId.value : this.statusId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IssueData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('point: $point, ')
          ..write('cycleId: $cycleId, ')
          ..write('statusId: $statusId, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, body, point, cycleId, statusId, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IssueData &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.point == this.point &&
          other.cycleId == this.cycleId &&
          other.statusId == this.statusId &&
          other.sortOrder == this.sortOrder);
}

class IssueCompanion extends UpdateCompanion<IssueData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> body;
  final Value<int> point;
  final Value<int> cycleId;
  final Value<int> statusId;
  final Value<int> sortOrder;
  const IssueCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.point = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.statusId = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  IssueCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String body,
    required int point,
    required int cycleId,
    required int statusId,
    required int sortOrder,
  }) : title = Value(title),
       body = Value(body),
       point = Value(point),
       cycleId = Value(cycleId),
       statusId = Value(statusId),
       sortOrder = Value(sortOrder);
  static Insertable<IssueData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<int>? point,
    Expression<int>? cycleId,
    Expression<int>? statusId,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (point != null) 'point': point,
      if (cycleId != null) 'cycle_id': cycleId,
      if (statusId != null) 'status_id': statusId,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  IssueCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? body,
    Value<int>? point,
    Value<int>? cycleId,
    Value<int>? statusId,
    Value<int>? sortOrder,
  }) {
    return IssueCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      point: point ?? this.point,
      cycleId: cycleId ?? this.cycleId,
      statusId: statusId ?? this.statusId,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (point.present) {
      map['point'] = Variable<int>(point.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<int>(cycleId.value);
    }
    if (statusId.present) {
      map['status_id'] = Variable<int>(statusId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IssueCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('point: $point, ')
          ..write('cycleId: $cycleId, ')
          ..write('statusId: $statusId, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

abstract class _$NoZanLaneDatabase extends GeneratedDatabase {
  _$NoZanLaneDatabase(QueryExecutor e) : super(e);
  $NoZanLaneDatabaseManager get managers => $NoZanLaneDatabaseManager(this);
  late final $CycleTable cycle = $CycleTable(this);
  late final $StatusTable status = $StatusTable(this);
  late final $IssueTable issue = $IssueTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cycle, status, issue];
}

typedef $$CycleTableCreateCompanionBuilder =
    CycleCompanion Function({
      Value<int> id,
      required int createdAt,
      required int updatedAt,
      required int startAt,
      required int endAt,
    });
typedef $$CycleTableUpdateCompanionBuilder =
    CycleCompanion Function({
      Value<int> id,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> startAt,
      Value<int> endAt,
    });

final class $$CycleTableReferences
    extends BaseReferences<_$NoZanLaneDatabase, $CycleTable, CycleData> {
  $$CycleTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IssueTable, List<IssueData>> _issueRefsTable(
    _$NoZanLaneDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.issue,
    aliasName: $_aliasNameGenerator(db.cycle.id, db.issue.cycleId),
  );

  $$IssueTableProcessedTableManager get issueRefs {
    final manager = $$IssueTableTableManager(
      $_db,
      $_db.issue,
    ).filter((f) => f.cycleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_issueRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CycleTableFilterComposer
    extends Composer<_$NoZanLaneDatabase, $CycleTable> {
  $$CycleTableFilterComposer({
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

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> issueRefs(
    Expression<bool> Function($$IssueTableFilterComposer f) f,
  ) {
    final $$IssueTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issue,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssueTableFilterComposer(
            $db: $db,
            $table: $db.issue,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CycleTableOrderingComposer
    extends Composer<_$NoZanLaneDatabase, $CycleTable> {
  $$CycleTableOrderingComposer({
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

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CycleTableAnnotationComposer
    extends Composer<_$NoZanLaneDatabase, $CycleTable> {
  $$CycleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<int> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);

  Expression<T> issueRefs<T extends Object>(
    Expression<T> Function($$IssueTableAnnotationComposer a) f,
  ) {
    final $$IssueTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issue,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssueTableAnnotationComposer(
            $db: $db,
            $table: $db.issue,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CycleTableTableManager
    extends
        RootTableManager<
          _$NoZanLaneDatabase,
          $CycleTable,
          CycleData,
          $$CycleTableFilterComposer,
          $$CycleTableOrderingComposer,
          $$CycleTableAnnotationComposer,
          $$CycleTableCreateCompanionBuilder,
          $$CycleTableUpdateCompanionBuilder,
          (CycleData, $$CycleTableReferences),
          CycleData,
          PrefetchHooks Function({bool issueRefs})
        > {
  $$CycleTableTableManager(_$NoZanLaneDatabase db, $CycleTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CycleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CycleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CycleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> startAt = const Value.absent(),
                Value<int> endAt = const Value.absent(),
              }) => CycleCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                startAt: startAt,
                endAt: endAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                required int startAt,
                required int endAt,
              }) => CycleCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                startAt: startAt,
                endAt: endAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$CycleTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({issueRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (issueRefs) db.issue],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (issueRefs)
                    await $_getPrefetchedData<
                      CycleData,
                      $CycleTable,
                      IssueData
                    >(
                      currentTable: table,
                      referencedTable: $$CycleTableReferences._issueRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$CycleTableReferences(db, table, p0).issueRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.cycleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CycleTableProcessedTableManager =
    ProcessedTableManager<
      _$NoZanLaneDatabase,
      $CycleTable,
      CycleData,
      $$CycleTableFilterComposer,
      $$CycleTableOrderingComposer,
      $$CycleTableAnnotationComposer,
      $$CycleTableCreateCompanionBuilder,
      $$CycleTableUpdateCompanionBuilder,
      (CycleData, $$CycleTableReferences),
      CycleData,
      PrefetchHooks Function({bool issueRefs})
    >;
typedef $$StatusTableCreateCompanionBuilder =
    StatusCompanion Function({
      Value<int> id,
      required String label,
      required int color,
    });
typedef $$StatusTableUpdateCompanionBuilder =
    StatusCompanion Function({
      Value<int> id,
      Value<String> label,
      Value<int> color,
    });

final class $$StatusTableReferences
    extends BaseReferences<_$NoZanLaneDatabase, $StatusTable, StatusData> {
  $$StatusTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IssueTable, List<IssueData>> _issueRefsTable(
    _$NoZanLaneDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.issue,
    aliasName: $_aliasNameGenerator(db.status.id, db.issue.statusId),
  );

  $$IssueTableProcessedTableManager get issueRefs {
    final manager = $$IssueTableTableManager(
      $_db,
      $_db.issue,
    ).filter((f) => f.statusId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_issueRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StatusTableFilterComposer
    extends Composer<_$NoZanLaneDatabase, $StatusTable> {
  $$StatusTableFilterComposer({
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

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> issueRefs(
    Expression<bool> Function($$IssueTableFilterComposer f) f,
  ) {
    final $$IssueTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issue,
      getReferencedColumn: (t) => t.statusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssueTableFilterComposer(
            $db: $db,
            $table: $db.issue,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StatusTableOrderingComposer
    extends Composer<_$NoZanLaneDatabase, $StatusTable> {
  $$StatusTableOrderingComposer({
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

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StatusTableAnnotationComposer
    extends Composer<_$NoZanLaneDatabase, $StatusTable> {
  $$StatusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  Expression<T> issueRefs<T extends Object>(
    Expression<T> Function($$IssueTableAnnotationComposer a) f,
  ) {
    final $$IssueTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.issue,
      getReferencedColumn: (t) => t.statusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IssueTableAnnotationComposer(
            $db: $db,
            $table: $db.issue,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StatusTableTableManager
    extends
        RootTableManager<
          _$NoZanLaneDatabase,
          $StatusTable,
          StatusData,
          $$StatusTableFilterComposer,
          $$StatusTableOrderingComposer,
          $$StatusTableAnnotationComposer,
          $$StatusTableCreateCompanionBuilder,
          $$StatusTableUpdateCompanionBuilder,
          (StatusData, $$StatusTableReferences),
          StatusData,
          PrefetchHooks Function({bool issueRefs})
        > {
  $$StatusTableTableManager(_$NoZanLaneDatabase db, $StatusTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<int> color = const Value.absent(),
              }) => StatusCompanion(id: id, label: label, color: color),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String label,
                required int color,
              }) => StatusCompanion.insert(id: id, label: label, color: color),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$StatusTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({issueRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (issueRefs) db.issue],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (issueRefs)
                    await $_getPrefetchedData<
                      StatusData,
                      $StatusTable,
                      IssueData
                    >(
                      currentTable: table,
                      referencedTable: $$StatusTableReferences._issueRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$StatusTableReferences(db, table, p0).issueRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.statusId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$StatusTableProcessedTableManager =
    ProcessedTableManager<
      _$NoZanLaneDatabase,
      $StatusTable,
      StatusData,
      $$StatusTableFilterComposer,
      $$StatusTableOrderingComposer,
      $$StatusTableAnnotationComposer,
      $$StatusTableCreateCompanionBuilder,
      $$StatusTableUpdateCompanionBuilder,
      (StatusData, $$StatusTableReferences),
      StatusData,
      PrefetchHooks Function({bool issueRefs})
    >;
typedef $$IssueTableCreateCompanionBuilder =
    IssueCompanion Function({
      Value<int> id,
      required String title,
      required String body,
      required int point,
      required int cycleId,
      required int statusId,
      required int sortOrder,
    });
typedef $$IssueTableUpdateCompanionBuilder =
    IssueCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> body,
      Value<int> point,
      Value<int> cycleId,
      Value<int> statusId,
      Value<int> sortOrder,
    });

final class $$IssueTableReferences
    extends BaseReferences<_$NoZanLaneDatabase, $IssueTable, IssueData> {
  $$IssueTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CycleTable _cycleIdTable(_$NoZanLaneDatabase db) =>
      db.cycle.createAlias($_aliasNameGenerator(db.issue.cycleId, db.cycle.id));

  $$CycleTableProcessedTableManager get cycleId {
    final $_column = $_itemColumn<int>('cycle_id')!;

    final manager = $$CycleTableTableManager(
      $_db,
      $_db.cycle,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cycleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StatusTable _statusIdTable(_$NoZanLaneDatabase db) => db.status
      .createAlias($_aliasNameGenerator(db.issue.statusId, db.status.id));

  $$StatusTableProcessedTableManager get statusId {
    final $_column = $_itemColumn<int>('status_id')!;

    final manager = $$StatusTableTableManager(
      $_db,
      $_db.status,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_statusIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IssueTableFilterComposer
    extends Composer<_$NoZanLaneDatabase, $IssueTable> {
  $$IssueTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get point => $composableBuilder(
    column: $table.point,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$CycleTableFilterComposer get cycleId {
    final $$CycleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.cycle,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CycleTableFilterComposer(
            $db: $db,
            $table: $db.cycle,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatusTableFilterComposer get statusId {
    final $$StatusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statusId,
      referencedTable: $db.status,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatusTableFilterComposer(
            $db: $db,
            $table: $db.status,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueTableOrderingComposer
    extends Composer<_$NoZanLaneDatabase, $IssueTable> {
  $$IssueTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get point => $composableBuilder(
    column: $table.point,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$CycleTableOrderingComposer get cycleId {
    final $$CycleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.cycle,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CycleTableOrderingComposer(
            $db: $db,
            $table: $db.cycle,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatusTableOrderingComposer get statusId {
    final $$StatusTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statusId,
      referencedTable: $db.status,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatusTableOrderingComposer(
            $db: $db,
            $table: $db.status,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueTableAnnotationComposer
    extends Composer<_$NoZanLaneDatabase, $IssueTable> {
  $$IssueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<int> get point =>
      $composableBuilder(column: $table.point, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$CycleTableAnnotationComposer get cycleId {
    final $$CycleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.cycle,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CycleTableAnnotationComposer(
            $db: $db,
            $table: $db.cycle,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatusTableAnnotationComposer get statusId {
    final $$StatusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statusId,
      referencedTable: $db.status,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatusTableAnnotationComposer(
            $db: $db,
            $table: $db.status,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IssueTableTableManager
    extends
        RootTableManager<
          _$NoZanLaneDatabase,
          $IssueTable,
          IssueData,
          $$IssueTableFilterComposer,
          $$IssueTableOrderingComposer,
          $$IssueTableAnnotationComposer,
          $$IssueTableCreateCompanionBuilder,
          $$IssueTableUpdateCompanionBuilder,
          (IssueData, $$IssueTableReferences),
          IssueData,
          PrefetchHooks Function({bool cycleId, bool statusId})
        > {
  $$IssueTableTableManager(_$NoZanLaneDatabase db, $IssueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IssueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IssueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IssueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<int> point = const Value.absent(),
                Value<int> cycleId = const Value.absent(),
                Value<int> statusId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => IssueCompanion(
                id: id,
                title: title,
                body: body,
                point: point,
                cycleId: cycleId,
                statusId: statusId,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String body,
                required int point,
                required int cycleId,
                required int statusId,
                required int sortOrder,
              }) => IssueCompanion.insert(
                id: id,
                title: title,
                body: body,
                point: point,
                cycleId: cycleId,
                statusId: statusId,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$IssueTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({cycleId = false, statusId = false}) {
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
                    if (cycleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cycleId,
                                referencedTable: $$IssueTableReferences
                                    ._cycleIdTable(db),
                                referencedColumn: $$IssueTableReferences
                                    ._cycleIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (statusId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.statusId,
                                referencedTable: $$IssueTableReferences
                                    ._statusIdTable(db),
                                referencedColumn: $$IssueTableReferences
                                    ._statusIdTable(db)
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

typedef $$IssueTableProcessedTableManager =
    ProcessedTableManager<
      _$NoZanLaneDatabase,
      $IssueTable,
      IssueData,
      $$IssueTableFilterComposer,
      $$IssueTableOrderingComposer,
      $$IssueTableAnnotationComposer,
      $$IssueTableCreateCompanionBuilder,
      $$IssueTableUpdateCompanionBuilder,
      (IssueData, $$IssueTableReferences),
      IssueData,
      PrefetchHooks Function({bool cycleId, bool statusId})
    >;

class $NoZanLaneDatabaseManager {
  final _$NoZanLaneDatabase _db;
  $NoZanLaneDatabaseManager(this._db);
  $$CycleTableTableManager get cycle =>
      $$CycleTableTableManager(_db, _db.cycle);
  $$StatusTableTableManager get status =>
      $$StatusTableTableManager(_db, _db.status);
  $$IssueTableTableManager get issue =>
      $$IssueTableTableManager(_db, _db.issue);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// NoZanLaneDatabase の生成と初期化を担当する Provider。

@ProviderFor(noZanLaneDatabase)
final noZanLaneDatabaseProvider = NoZanLaneDatabaseProvider._();

/// NoZanLaneDatabase の生成と初期化を担当する Provider。

final class NoZanLaneDatabaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<NoZanLaneDatabase>,
          NoZanLaneDatabase,
          FutureOr<NoZanLaneDatabase>
        >
    with
        $FutureModifier<NoZanLaneDatabase>,
        $FutureProvider<NoZanLaneDatabase> {
  /// NoZanLaneDatabase の生成と初期化を担当する Provider。
  NoZanLaneDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noZanLaneDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noZanLaneDatabaseHash();

  @$internal
  @override
  $FutureProviderElement<NoZanLaneDatabase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NoZanLaneDatabase> create(Ref ref) {
    return noZanLaneDatabase(ref);
  }
}

String _$noZanLaneDatabaseHash() => r'4c7a0c35fe7e0e899a6d6bab22ea6d210e21c8f7';
