// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WordCategoriesTable extends WordCategories
    with TableInfo<$WordCategoriesTable, WordCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameTaMeta = const VerificationMeta('nameTa');
  @override
  late final GeneratedColumn<String> nameTa = GeneratedColumn<String>(
    'name_ta',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [id, nameEn, nameTa, emoji, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<WordCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('name_ta')) {
      context.handle(
        _nameTaMeta,
        nameTa.isAcceptableOrUnknown(data['name_ta']!, _nameTaMeta),
      );
    } else if (isInserting) {
      context.missing(_nameTaMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
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
  WordCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      nameTa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ta'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $WordCategoriesTable createAlias(String alias) {
    return $WordCategoriesTable(attachedDatabase, alias);
  }
}

class WordCategory extends DataClass implements Insertable<WordCategory> {
  final String id;
  final String nameEn;
  final String nameTa;
  final String emoji;
  final int sortOrder;
  const WordCategory({
    required this.id,
    required this.nameEn,
    required this.nameTa,
    required this.emoji,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name_en'] = Variable<String>(nameEn);
    map['name_ta'] = Variable<String>(nameTa);
    map['emoji'] = Variable<String>(emoji);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  WordCategoriesCompanion toCompanion(bool nullToAbsent) {
    return WordCategoriesCompanion(
      id: Value(id),
      nameEn: Value(nameEn),
      nameTa: Value(nameTa),
      emoji: Value(emoji),
      sortOrder: Value(sortOrder),
    );
  }

  factory WordCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordCategory(
      id: serializer.fromJson<String>(json['id']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      nameTa: serializer.fromJson<String>(json['nameTa']),
      emoji: serializer.fromJson<String>(json['emoji']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nameEn': serializer.toJson<String>(nameEn),
      'nameTa': serializer.toJson<String>(nameTa),
      'emoji': serializer.toJson<String>(emoji),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  WordCategory copyWith({
    String? id,
    String? nameEn,
    String? nameTa,
    String? emoji,
    int? sortOrder,
  }) => WordCategory(
    id: id ?? this.id,
    nameEn: nameEn ?? this.nameEn,
    nameTa: nameTa ?? this.nameTa,
    emoji: emoji ?? this.emoji,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  WordCategory copyWithCompanion(WordCategoriesCompanion data) {
    return WordCategory(
      id: data.id.present ? data.id.value : this.id,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      nameTa: data.nameTa.present ? data.nameTa.value : this.nameTa,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordCategory(')
          ..write('id: $id, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameTa: $nameTa, ')
          ..write('emoji: $emoji, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameEn, nameTa, emoji, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordCategory &&
          other.id == this.id &&
          other.nameEn == this.nameEn &&
          other.nameTa == this.nameTa &&
          other.emoji == this.emoji &&
          other.sortOrder == this.sortOrder);
}

class WordCategoriesCompanion extends UpdateCompanion<WordCategory> {
  final Value<String> id;
  final Value<String> nameEn;
  final Value<String> nameTa;
  final Value<String> emoji;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const WordCategoriesCompanion({
    this.id = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.nameTa = const Value.absent(),
    this.emoji = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordCategoriesCompanion.insert({
    required String id,
    required String nameEn,
    required String nameTa,
    required String emoji,
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nameEn = Value(nameEn),
       nameTa = Value(nameTa),
       emoji = Value(emoji),
       sortOrder = Value(sortOrder);
  static Insertable<WordCategory> custom({
    Expression<String>? id,
    Expression<String>? nameEn,
    Expression<String>? nameTa,
    Expression<String>? emoji,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameEn != null) 'name_en': nameEn,
      if (nameTa != null) 'name_ta': nameTa,
      if (emoji != null) 'emoji': emoji,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? nameEn,
    Value<String>? nameTa,
    Value<String>? emoji,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return WordCategoriesCompanion(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameTa: nameTa ?? this.nameTa,
      emoji: emoji ?? this.emoji,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (nameTa.present) {
      map['name_ta'] = Variable<String>(nameTa.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('nameEn: $nameEn, ')
          ..write('nameTa: $nameTa, ')
          ..write('emoji: $emoji, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WordEntriesTable extends WordEntries
    with TableInfo<$WordEntriesTable, WordEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceLangMeta = const VerificationMeta(
    'sourceLang',
  );
  @override
  late final GeneratedColumn<String> sourceLang = GeneratedColumn<String>(
    'source_lang',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('ta'),
  );
  static const VerificationMeta _targetLangMeta = const VerificationMeta(
    'targetLang',
  );
  @override
  late final GeneratedColumn<String> targetLang = GeneratedColumn<String>(
    'target_lang',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('en'),
  );
  static const VerificationMeta _tamilMeta = const VerificationMeta('tamil');
  @override
  late final GeneratedColumn<String> tamil = GeneratedColumn<String>(
    'tamil',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transliterationMeta = const VerificationMeta(
    'transliteration',
  );
  @override
  late final GeneratedColumn<String> transliteration = GeneratedColumn<String>(
    'transliteration',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _englishMeta = const VerificationMeta(
    'english',
  );
  @override
  late final GeneratedColumn<String> english = GeneratedColumn<String>(
    'english',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ipaMeta = const VerificationMeta('ipa');
  @override
  late final GeneratedColumn<String> ipa = GeneratedColumn<String>(
    'ipa',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pronunciationMeta = const VerificationMeta(
    'pronunciation',
  );
  @override
  late final GeneratedColumn<String> pronunciation = GeneratedColumn<String>(
    'pronunciation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partOfSpeechMeta = const VerificationMeta(
    'partOfSpeech',
  );
  @override
  late final GeneratedColumn<String> partOfSpeech = GeneratedColumn<String>(
    'part_of_speech',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cefrMeta = const VerificationMeta('cefr');
  @override
  late final GeneratedColumn<String> cefr = GeneratedColumn<String>(
    'cefr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _audioPathMeta = const VerificationMeta(
    'audioPath',
  );
  @override
  late final GeneratedColumn<String> audioPath = GeneratedColumn<String>(
    'audio_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usageNoteMeta = const VerificationMeta(
    'usageNote',
  );
  @override
  late final GeneratedColumn<String> usageNote = GeneratedColumn<String>(
    'usage_note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _commonMistakesMeta = const VerificationMeta(
    'commonMistakes',
  );
  @override
  late final GeneratedColumn<String> commonMistakes = GeneratedColumn<String>(
    'common_mistakes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _britishNoteMeta = const VerificationMeta(
    'britishNote',
  );
  @override
  late final GeneratedColumn<String> britishNote = GeneratedColumn<String>(
    'british_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dutchNoteMeta = const VerificationMeta(
    'dutchNote',
  );
  @override
  late final GeneratedColumn<String> dutchNote = GeneratedColumn<String>(
    'dutch_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('seed'),
  );
  static const VerificationMeta _savedMeta = const VerificationMeta('saved');
  @override
  late final GeneratedColumn<bool> saved = GeneratedColumn<bool>(
    'saved',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("saved" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    sourceLang,
    targetLang,
    tamil,
    transliteration,
    english,
    ipa,
    pronunciation,
    partOfSpeech,
    cefr,
    emoji,
    imagePath,
    audioPath,
    usageNote,
    commonMistakes,
    britishNote,
    dutchNote,
    origin,
    saved,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<WordEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('source_lang')) {
      context.handle(
        _sourceLangMeta,
        sourceLang.isAcceptableOrUnknown(data['source_lang']!, _sourceLangMeta),
      );
    }
    if (data.containsKey('target_lang')) {
      context.handle(
        _targetLangMeta,
        targetLang.isAcceptableOrUnknown(data['target_lang']!, _targetLangMeta),
      );
    }
    if (data.containsKey('tamil')) {
      context.handle(
        _tamilMeta,
        tamil.isAcceptableOrUnknown(data['tamil']!, _tamilMeta),
      );
    } else if (isInserting) {
      context.missing(_tamilMeta);
    }
    if (data.containsKey('transliteration')) {
      context.handle(
        _transliterationMeta,
        transliteration.isAcceptableOrUnknown(
          data['transliteration']!,
          _transliterationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transliterationMeta);
    }
    if (data.containsKey('english')) {
      context.handle(
        _englishMeta,
        english.isAcceptableOrUnknown(data['english']!, _englishMeta),
      );
    } else if (isInserting) {
      context.missing(_englishMeta);
    }
    if (data.containsKey('ipa')) {
      context.handle(
        _ipaMeta,
        ipa.isAcceptableOrUnknown(data['ipa']!, _ipaMeta),
      );
    } else if (isInserting) {
      context.missing(_ipaMeta);
    }
    if (data.containsKey('pronunciation')) {
      context.handle(
        _pronunciationMeta,
        pronunciation.isAcceptableOrUnknown(
          data['pronunciation']!,
          _pronunciationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pronunciationMeta);
    }
    if (data.containsKey('part_of_speech')) {
      context.handle(
        _partOfSpeechMeta,
        partOfSpeech.isAcceptableOrUnknown(
          data['part_of_speech']!,
          _partOfSpeechMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_partOfSpeechMeta);
    }
    if (data.containsKey('cefr')) {
      context.handle(
        _cefrMeta,
        cefr.isAcceptableOrUnknown(data['cefr']!, _cefrMeta),
      );
    } else if (isInserting) {
      context.missing(_cefrMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('audio_path')) {
      context.handle(
        _audioPathMeta,
        audioPath.isAcceptableOrUnknown(data['audio_path']!, _audioPathMeta),
      );
    }
    if (data.containsKey('usage_note')) {
      context.handle(
        _usageNoteMeta,
        usageNote.isAcceptableOrUnknown(data['usage_note']!, _usageNoteMeta),
      );
    }
    if (data.containsKey('common_mistakes')) {
      context.handle(
        _commonMistakesMeta,
        commonMistakes.isAcceptableOrUnknown(
          data['common_mistakes']!,
          _commonMistakesMeta,
        ),
      );
    }
    if (data.containsKey('british_note')) {
      context.handle(
        _britishNoteMeta,
        britishNote.isAcceptableOrUnknown(
          data['british_note']!,
          _britishNoteMeta,
        ),
      );
    }
    if (data.containsKey('dutch_note')) {
      context.handle(
        _dutchNoteMeta,
        dutchNote.isAcceptableOrUnknown(data['dutch_note']!, _dutchNoteMeta),
      );
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    }
    if (data.containsKey('saved')) {
      context.handle(
        _savedMeta,
        saved.isAcceptableOrUnknown(data['saved']!, _savedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      sourceLang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_lang'],
      )!,
      targetLang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_lang'],
      )!,
      tamil: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tamil'],
      )!,
      transliteration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transliteration'],
      )!,
      english: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english'],
      )!,
      ipa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ipa'],
      )!,
      pronunciation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pronunciation'],
      )!,
      partOfSpeech: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}part_of_speech'],
      )!,
      cefr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cefr'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      audioPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_path'],
      ),
      usageNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usage_note'],
      )!,
      commonMistakes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}common_mistakes'],
      )!,
      britishNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}british_note'],
      ),
      dutchNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dutch_note'],
      ),
      origin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin'],
      )!,
      saved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}saved'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WordEntriesTable createAlias(String alias) {
    return $WordEntriesTable(attachedDatabase, alias);
  }
}

class WordEntry extends DataClass implements Insertable<WordEntry> {
  final String id;
  final String categoryId;
  final String sourceLang;
  final String targetLang;
  final String tamil;
  final String transliteration;
  final String english;
  final String ipa;
  final String pronunciation;
  final String partOfSpeech;
  final String cefr;
  final String? emoji;
  final String? imagePath;
  final String? audioPath;
  final String usageNote;
  final String commonMistakes;
  final String? britishNote;
  final String? dutchNote;
  final String origin;
  final bool saved;
  final DateTime createdAt;
  const WordEntry({
    required this.id,
    required this.categoryId,
    required this.sourceLang,
    required this.targetLang,
    required this.tamil,
    required this.transliteration,
    required this.english,
    required this.ipa,
    required this.pronunciation,
    required this.partOfSpeech,
    required this.cefr,
    this.emoji,
    this.imagePath,
    this.audioPath,
    required this.usageNote,
    required this.commonMistakes,
    this.britishNote,
    this.dutchNote,
    required this.origin,
    required this.saved,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category_id'] = Variable<String>(categoryId);
    map['source_lang'] = Variable<String>(sourceLang);
    map['target_lang'] = Variable<String>(targetLang);
    map['tamil'] = Variable<String>(tamil);
    map['transliteration'] = Variable<String>(transliteration);
    map['english'] = Variable<String>(english);
    map['ipa'] = Variable<String>(ipa);
    map['pronunciation'] = Variable<String>(pronunciation);
    map['part_of_speech'] = Variable<String>(partOfSpeech);
    map['cefr'] = Variable<String>(cefr);
    if (!nullToAbsent || emoji != null) {
      map['emoji'] = Variable<String>(emoji);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || audioPath != null) {
      map['audio_path'] = Variable<String>(audioPath);
    }
    map['usage_note'] = Variable<String>(usageNote);
    map['common_mistakes'] = Variable<String>(commonMistakes);
    if (!nullToAbsent || britishNote != null) {
      map['british_note'] = Variable<String>(britishNote);
    }
    if (!nullToAbsent || dutchNote != null) {
      map['dutch_note'] = Variable<String>(dutchNote);
    }
    map['origin'] = Variable<String>(origin);
    map['saved'] = Variable<bool>(saved);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WordEntriesCompanion toCompanion(bool nullToAbsent) {
    return WordEntriesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      sourceLang: Value(sourceLang),
      targetLang: Value(targetLang),
      tamil: Value(tamil),
      transliteration: Value(transliteration),
      english: Value(english),
      ipa: Value(ipa),
      pronunciation: Value(pronunciation),
      partOfSpeech: Value(partOfSpeech),
      cefr: Value(cefr),
      emoji: emoji == null && nullToAbsent
          ? const Value.absent()
          : Value(emoji),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      audioPath: audioPath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioPath),
      usageNote: Value(usageNote),
      commonMistakes: Value(commonMistakes),
      britishNote: britishNote == null && nullToAbsent
          ? const Value.absent()
          : Value(britishNote),
      dutchNote: dutchNote == null && nullToAbsent
          ? const Value.absent()
          : Value(dutchNote),
      origin: Value(origin),
      saved: Value(saved),
      createdAt: Value(createdAt),
    );
  }

  factory WordEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordEntry(
      id: serializer.fromJson<String>(json['id']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      sourceLang: serializer.fromJson<String>(json['sourceLang']),
      targetLang: serializer.fromJson<String>(json['targetLang']),
      tamil: serializer.fromJson<String>(json['tamil']),
      transliteration: serializer.fromJson<String>(json['transliteration']),
      english: serializer.fromJson<String>(json['english']),
      ipa: serializer.fromJson<String>(json['ipa']),
      pronunciation: serializer.fromJson<String>(json['pronunciation']),
      partOfSpeech: serializer.fromJson<String>(json['partOfSpeech']),
      cefr: serializer.fromJson<String>(json['cefr']),
      emoji: serializer.fromJson<String?>(json['emoji']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      audioPath: serializer.fromJson<String?>(json['audioPath']),
      usageNote: serializer.fromJson<String>(json['usageNote']),
      commonMistakes: serializer.fromJson<String>(json['commonMistakes']),
      britishNote: serializer.fromJson<String?>(json['britishNote']),
      dutchNote: serializer.fromJson<String?>(json['dutchNote']),
      origin: serializer.fromJson<String>(json['origin']),
      saved: serializer.fromJson<bool>(json['saved']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'categoryId': serializer.toJson<String>(categoryId),
      'sourceLang': serializer.toJson<String>(sourceLang),
      'targetLang': serializer.toJson<String>(targetLang),
      'tamil': serializer.toJson<String>(tamil),
      'transliteration': serializer.toJson<String>(transliteration),
      'english': serializer.toJson<String>(english),
      'ipa': serializer.toJson<String>(ipa),
      'pronunciation': serializer.toJson<String>(pronunciation),
      'partOfSpeech': serializer.toJson<String>(partOfSpeech),
      'cefr': serializer.toJson<String>(cefr),
      'emoji': serializer.toJson<String?>(emoji),
      'imagePath': serializer.toJson<String?>(imagePath),
      'audioPath': serializer.toJson<String?>(audioPath),
      'usageNote': serializer.toJson<String>(usageNote),
      'commonMistakes': serializer.toJson<String>(commonMistakes),
      'britishNote': serializer.toJson<String?>(britishNote),
      'dutchNote': serializer.toJson<String?>(dutchNote),
      'origin': serializer.toJson<String>(origin),
      'saved': serializer.toJson<bool>(saved),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WordEntry copyWith({
    String? id,
    String? categoryId,
    String? sourceLang,
    String? targetLang,
    String? tamil,
    String? transliteration,
    String? english,
    String? ipa,
    String? pronunciation,
    String? partOfSpeech,
    String? cefr,
    Value<String?> emoji = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    Value<String?> audioPath = const Value.absent(),
    String? usageNote,
    String? commonMistakes,
    Value<String?> britishNote = const Value.absent(),
    Value<String?> dutchNote = const Value.absent(),
    String? origin,
    bool? saved,
    DateTime? createdAt,
  }) => WordEntry(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    sourceLang: sourceLang ?? this.sourceLang,
    targetLang: targetLang ?? this.targetLang,
    tamil: tamil ?? this.tamil,
    transliteration: transliteration ?? this.transliteration,
    english: english ?? this.english,
    ipa: ipa ?? this.ipa,
    pronunciation: pronunciation ?? this.pronunciation,
    partOfSpeech: partOfSpeech ?? this.partOfSpeech,
    cefr: cefr ?? this.cefr,
    emoji: emoji.present ? emoji.value : this.emoji,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    audioPath: audioPath.present ? audioPath.value : this.audioPath,
    usageNote: usageNote ?? this.usageNote,
    commonMistakes: commonMistakes ?? this.commonMistakes,
    britishNote: britishNote.present ? britishNote.value : this.britishNote,
    dutchNote: dutchNote.present ? dutchNote.value : this.dutchNote,
    origin: origin ?? this.origin,
    saved: saved ?? this.saved,
    createdAt: createdAt ?? this.createdAt,
  );
  WordEntry copyWithCompanion(WordEntriesCompanion data) {
    return WordEntry(
      id: data.id.present ? data.id.value : this.id,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      sourceLang: data.sourceLang.present
          ? data.sourceLang.value
          : this.sourceLang,
      targetLang: data.targetLang.present
          ? data.targetLang.value
          : this.targetLang,
      tamil: data.tamil.present ? data.tamil.value : this.tamil,
      transliteration: data.transliteration.present
          ? data.transliteration.value
          : this.transliteration,
      english: data.english.present ? data.english.value : this.english,
      ipa: data.ipa.present ? data.ipa.value : this.ipa,
      pronunciation: data.pronunciation.present
          ? data.pronunciation.value
          : this.pronunciation,
      partOfSpeech: data.partOfSpeech.present
          ? data.partOfSpeech.value
          : this.partOfSpeech,
      cefr: data.cefr.present ? data.cefr.value : this.cefr,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      audioPath: data.audioPath.present ? data.audioPath.value : this.audioPath,
      usageNote: data.usageNote.present ? data.usageNote.value : this.usageNote,
      commonMistakes: data.commonMistakes.present
          ? data.commonMistakes.value
          : this.commonMistakes,
      britishNote: data.britishNote.present
          ? data.britishNote.value
          : this.britishNote,
      dutchNote: data.dutchNote.present ? data.dutchNote.value : this.dutchNote,
      origin: data.origin.present ? data.origin.value : this.origin,
      saved: data.saved.present ? data.saved.value : this.saved,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordEntry(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('sourceLang: $sourceLang, ')
          ..write('targetLang: $targetLang, ')
          ..write('tamil: $tamil, ')
          ..write('transliteration: $transliteration, ')
          ..write('english: $english, ')
          ..write('ipa: $ipa, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('cefr: $cefr, ')
          ..write('emoji: $emoji, ')
          ..write('imagePath: $imagePath, ')
          ..write('audioPath: $audioPath, ')
          ..write('usageNote: $usageNote, ')
          ..write('commonMistakes: $commonMistakes, ')
          ..write('britishNote: $britishNote, ')
          ..write('dutchNote: $dutchNote, ')
          ..write('origin: $origin, ')
          ..write('saved: $saved, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    categoryId,
    sourceLang,
    targetLang,
    tamil,
    transliteration,
    english,
    ipa,
    pronunciation,
    partOfSpeech,
    cefr,
    emoji,
    imagePath,
    audioPath,
    usageNote,
    commonMistakes,
    britishNote,
    dutchNote,
    origin,
    saved,
    createdAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordEntry &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.sourceLang == this.sourceLang &&
          other.targetLang == this.targetLang &&
          other.tamil == this.tamil &&
          other.transliteration == this.transliteration &&
          other.english == this.english &&
          other.ipa == this.ipa &&
          other.pronunciation == this.pronunciation &&
          other.partOfSpeech == this.partOfSpeech &&
          other.cefr == this.cefr &&
          other.emoji == this.emoji &&
          other.imagePath == this.imagePath &&
          other.audioPath == this.audioPath &&
          other.usageNote == this.usageNote &&
          other.commonMistakes == this.commonMistakes &&
          other.britishNote == this.britishNote &&
          other.dutchNote == this.dutchNote &&
          other.origin == this.origin &&
          other.saved == this.saved &&
          other.createdAt == this.createdAt);
}

class WordEntriesCompanion extends UpdateCompanion<WordEntry> {
  final Value<String> id;
  final Value<String> categoryId;
  final Value<String> sourceLang;
  final Value<String> targetLang;
  final Value<String> tamil;
  final Value<String> transliteration;
  final Value<String> english;
  final Value<String> ipa;
  final Value<String> pronunciation;
  final Value<String> partOfSpeech;
  final Value<String> cefr;
  final Value<String?> emoji;
  final Value<String?> imagePath;
  final Value<String?> audioPath;
  final Value<String> usageNote;
  final Value<String> commonMistakes;
  final Value<String?> britishNote;
  final Value<String?> dutchNote;
  final Value<String> origin;
  final Value<bool> saved;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const WordEntriesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.sourceLang = const Value.absent(),
    this.targetLang = const Value.absent(),
    this.tamil = const Value.absent(),
    this.transliteration = const Value.absent(),
    this.english = const Value.absent(),
    this.ipa = const Value.absent(),
    this.pronunciation = const Value.absent(),
    this.partOfSpeech = const Value.absent(),
    this.cefr = const Value.absent(),
    this.emoji = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.audioPath = const Value.absent(),
    this.usageNote = const Value.absent(),
    this.commonMistakes = const Value.absent(),
    this.britishNote = const Value.absent(),
    this.dutchNote = const Value.absent(),
    this.origin = const Value.absent(),
    this.saved = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WordEntriesCompanion.insert({
    required String id,
    required String categoryId,
    this.sourceLang = const Value.absent(),
    this.targetLang = const Value.absent(),
    required String tamil,
    required String transliteration,
    required String english,
    required String ipa,
    required String pronunciation,
    required String partOfSpeech,
    required String cefr,
    this.emoji = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.audioPath = const Value.absent(),
    this.usageNote = const Value.absent(),
    this.commonMistakes = const Value.absent(),
    this.britishNote = const Value.absent(),
    this.dutchNote = const Value.absent(),
    this.origin = const Value.absent(),
    this.saved = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       categoryId = Value(categoryId),
       tamil = Value(tamil),
       transliteration = Value(transliteration),
       english = Value(english),
       ipa = Value(ipa),
       pronunciation = Value(pronunciation),
       partOfSpeech = Value(partOfSpeech),
       cefr = Value(cefr);
  static Insertable<WordEntry> custom({
    Expression<String>? id,
    Expression<String>? categoryId,
    Expression<String>? sourceLang,
    Expression<String>? targetLang,
    Expression<String>? tamil,
    Expression<String>? transliteration,
    Expression<String>? english,
    Expression<String>? ipa,
    Expression<String>? pronunciation,
    Expression<String>? partOfSpeech,
    Expression<String>? cefr,
    Expression<String>? emoji,
    Expression<String>? imagePath,
    Expression<String>? audioPath,
    Expression<String>? usageNote,
    Expression<String>? commonMistakes,
    Expression<String>? britishNote,
    Expression<String>? dutchNote,
    Expression<String>? origin,
    Expression<bool>? saved,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (sourceLang != null) 'source_lang': sourceLang,
      if (targetLang != null) 'target_lang': targetLang,
      if (tamil != null) 'tamil': tamil,
      if (transliteration != null) 'transliteration': transliteration,
      if (english != null) 'english': english,
      if (ipa != null) 'ipa': ipa,
      if (pronunciation != null) 'pronunciation': pronunciation,
      if (partOfSpeech != null) 'part_of_speech': partOfSpeech,
      if (cefr != null) 'cefr': cefr,
      if (emoji != null) 'emoji': emoji,
      if (imagePath != null) 'image_path': imagePath,
      if (audioPath != null) 'audio_path': audioPath,
      if (usageNote != null) 'usage_note': usageNote,
      if (commonMistakes != null) 'common_mistakes': commonMistakes,
      if (britishNote != null) 'british_note': britishNote,
      if (dutchNote != null) 'dutch_note': dutchNote,
      if (origin != null) 'origin': origin,
      if (saved != null) 'saved': saved,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WordEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? categoryId,
    Value<String>? sourceLang,
    Value<String>? targetLang,
    Value<String>? tamil,
    Value<String>? transliteration,
    Value<String>? english,
    Value<String>? ipa,
    Value<String>? pronunciation,
    Value<String>? partOfSpeech,
    Value<String>? cefr,
    Value<String?>? emoji,
    Value<String?>? imagePath,
    Value<String?>? audioPath,
    Value<String>? usageNote,
    Value<String>? commonMistakes,
    Value<String?>? britishNote,
    Value<String?>? dutchNote,
    Value<String>? origin,
    Value<bool>? saved,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return WordEntriesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      sourceLang: sourceLang ?? this.sourceLang,
      targetLang: targetLang ?? this.targetLang,
      tamil: tamil ?? this.tamil,
      transliteration: transliteration ?? this.transliteration,
      english: english ?? this.english,
      ipa: ipa ?? this.ipa,
      pronunciation: pronunciation ?? this.pronunciation,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      cefr: cefr ?? this.cefr,
      emoji: emoji ?? this.emoji,
      imagePath: imagePath ?? this.imagePath,
      audioPath: audioPath ?? this.audioPath,
      usageNote: usageNote ?? this.usageNote,
      commonMistakes: commonMistakes ?? this.commonMistakes,
      britishNote: britishNote ?? this.britishNote,
      dutchNote: dutchNote ?? this.dutchNote,
      origin: origin ?? this.origin,
      saved: saved ?? this.saved,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (sourceLang.present) {
      map['source_lang'] = Variable<String>(sourceLang.value);
    }
    if (targetLang.present) {
      map['target_lang'] = Variable<String>(targetLang.value);
    }
    if (tamil.present) {
      map['tamil'] = Variable<String>(tamil.value);
    }
    if (transliteration.present) {
      map['transliteration'] = Variable<String>(transliteration.value);
    }
    if (english.present) {
      map['english'] = Variable<String>(english.value);
    }
    if (ipa.present) {
      map['ipa'] = Variable<String>(ipa.value);
    }
    if (pronunciation.present) {
      map['pronunciation'] = Variable<String>(pronunciation.value);
    }
    if (partOfSpeech.present) {
      map['part_of_speech'] = Variable<String>(partOfSpeech.value);
    }
    if (cefr.present) {
      map['cefr'] = Variable<String>(cefr.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (audioPath.present) {
      map['audio_path'] = Variable<String>(audioPath.value);
    }
    if (usageNote.present) {
      map['usage_note'] = Variable<String>(usageNote.value);
    }
    if (commonMistakes.present) {
      map['common_mistakes'] = Variable<String>(commonMistakes.value);
    }
    if (britishNote.present) {
      map['british_note'] = Variable<String>(britishNote.value);
    }
    if (dutchNote.present) {
      map['dutch_note'] = Variable<String>(dutchNote.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (saved.present) {
      map['saved'] = Variable<bool>(saved.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordEntriesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('sourceLang: $sourceLang, ')
          ..write('targetLang: $targetLang, ')
          ..write('tamil: $tamil, ')
          ..write('transliteration: $transliteration, ')
          ..write('english: $english, ')
          ..write('ipa: $ipa, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('cefr: $cefr, ')
          ..write('emoji: $emoji, ')
          ..write('imagePath: $imagePath, ')
          ..write('audioPath: $audioPath, ')
          ..write('usageNote: $usageNote, ')
          ..write('commonMistakes: $commonMistakes, ')
          ..write('britishNote: $britishNote, ')
          ..write('dutchNote: $dutchNote, ')
          ..write('origin: $origin, ')
          ..write('saved: $saved, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WordExamplesTable extends WordExamples
    with TableInfo<$WordExamplesTable, WordExample> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordExamplesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<String> wordId = GeneratedColumn<String>(
    'word_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _englishMeta = const VerificationMeta(
    'english',
  );
  @override
  late final GeneratedColumn<String> english = GeneratedColumn<String>(
    'english',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tamilMeta = const VerificationMeta('tamil');
  @override
  late final GeneratedColumn<String> tamil = GeneratedColumn<String>(
    'tamil',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, wordId, kind, english, tamil];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_examples';
  @override
  VerificationContext validateIntegrity(
    Insertable<WordExample> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word_id')) {
      context.handle(
        _wordIdMeta,
        wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_wordIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('english')) {
      context.handle(
        _englishMeta,
        english.isAcceptableOrUnknown(data['english']!, _englishMeta),
      );
    } else if (isInserting) {
      context.missing(_englishMeta);
    }
    if (data.containsKey('tamil')) {
      context.handle(
        _tamilMeta,
        tamil.isAcceptableOrUnknown(data['tamil']!, _tamilMeta),
      );
    } else if (isInserting) {
      context.missing(_tamilMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordExample map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordExample(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      wordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      english: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}english'],
      )!,
      tamil: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tamil'],
      )!,
    );
  }

  @override
  $WordExamplesTable createAlias(String alias) {
    return $WordExamplesTable(attachedDatabase, alias);
  }
}

class WordExample extends DataClass implements Insertable<WordExample> {
  final int id;
  final String wordId;
  final String kind;
  final String english;
  final String tamil;
  const WordExample({
    required this.id,
    required this.wordId,
    required this.kind,
    required this.english,
    required this.tamil,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word_id'] = Variable<String>(wordId);
    map['kind'] = Variable<String>(kind);
    map['english'] = Variable<String>(english);
    map['tamil'] = Variable<String>(tamil);
    return map;
  }

  WordExamplesCompanion toCompanion(bool nullToAbsent) {
    return WordExamplesCompanion(
      id: Value(id),
      wordId: Value(wordId),
      kind: Value(kind),
      english: Value(english),
      tamil: Value(tamil),
    );
  }

  factory WordExample.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordExample(
      id: serializer.fromJson<int>(json['id']),
      wordId: serializer.fromJson<String>(json['wordId']),
      kind: serializer.fromJson<String>(json['kind']),
      english: serializer.fromJson<String>(json['english']),
      tamil: serializer.fromJson<String>(json['tamil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wordId': serializer.toJson<String>(wordId),
      'kind': serializer.toJson<String>(kind),
      'english': serializer.toJson<String>(english),
      'tamil': serializer.toJson<String>(tamil),
    };
  }

  WordExample copyWith({
    int? id,
    String? wordId,
    String? kind,
    String? english,
    String? tamil,
  }) => WordExample(
    id: id ?? this.id,
    wordId: wordId ?? this.wordId,
    kind: kind ?? this.kind,
    english: english ?? this.english,
    tamil: tamil ?? this.tamil,
  );
  WordExample copyWithCompanion(WordExamplesCompanion data) {
    return WordExample(
      id: data.id.present ? data.id.value : this.id,
      wordId: data.wordId.present ? data.wordId.value : this.wordId,
      kind: data.kind.present ? data.kind.value : this.kind,
      english: data.english.present ? data.english.value : this.english,
      tamil: data.tamil.present ? data.tamil.value : this.tamil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordExample(')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('kind: $kind, ')
          ..write('english: $english, ')
          ..write('tamil: $tamil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, wordId, kind, english, tamil);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordExample &&
          other.id == this.id &&
          other.wordId == this.wordId &&
          other.kind == this.kind &&
          other.english == this.english &&
          other.tamil == this.tamil);
}

class WordExamplesCompanion extends UpdateCompanion<WordExample> {
  final Value<int> id;
  final Value<String> wordId;
  final Value<String> kind;
  final Value<String> english;
  final Value<String> tamil;
  const WordExamplesCompanion({
    this.id = const Value.absent(),
    this.wordId = const Value.absent(),
    this.kind = const Value.absent(),
    this.english = const Value.absent(),
    this.tamil = const Value.absent(),
  });
  WordExamplesCompanion.insert({
    this.id = const Value.absent(),
    required String wordId,
    required String kind,
    required String english,
    required String tamil,
  }) : wordId = Value(wordId),
       kind = Value(kind),
       english = Value(english),
       tamil = Value(tamil);
  static Insertable<WordExample> custom({
    Expression<int>? id,
    Expression<String>? wordId,
    Expression<String>? kind,
    Expression<String>? english,
    Expression<String>? tamil,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wordId != null) 'word_id': wordId,
      if (kind != null) 'kind': kind,
      if (english != null) 'english': english,
      if (tamil != null) 'tamil': tamil,
    });
  }

  WordExamplesCompanion copyWith({
    Value<int>? id,
    Value<String>? wordId,
    Value<String>? kind,
    Value<String>? english,
    Value<String>? tamil,
  }) {
    return WordExamplesCompanion(
      id: id ?? this.id,
      wordId: wordId ?? this.wordId,
      kind: kind ?? this.kind,
      english: english ?? this.english,
      tamil: tamil ?? this.tamil,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wordId.present) {
      map['word_id'] = Variable<String>(wordId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (english.present) {
      map['english'] = Variable<String>(english.value);
    }
    if (tamil.present) {
      map['tamil'] = Variable<String>(tamil.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordExamplesCompanion(')
          ..write('id: $id, ')
          ..write('wordId: $wordId, ')
          ..write('kind: $kind, ')
          ..write('english: $english, ')
          ..write('tamil: $tamil')
          ..write(')'))
        .toString();
  }
}

class $ReviewStatesTable extends ReviewStates
    with TableInfo<$ReviewStatesTable, ReviewState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _wordIdMeta = const VerificationMeta('wordId');
  @override
  late final GeneratedColumn<String> wordId = GeneratedColumn<String>(
    'word_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _easeMeta = const VerificationMeta('ease');
  @override
  late final GeneratedColumn<double> ease = GeneratedColumn<double>(
    'ease',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _intervalDaysMeta = const VerificationMeta(
    'intervalDays',
  );
  @override
  late final GeneratedColumn<int> intervalDays = GeneratedColumn<int>(
    'interval_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lapsesMeta = const VerificationMeta('lapses');
  @override
  late final GeneratedColumn<int> lapses = GeneratedColumn<int>(
    'lapses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<DateTime> dueAt = GeneratedColumn<DateTime>(
    'due_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastReviewedAtMeta = const VerificationMeta(
    'lastReviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>(
        'last_reviewed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    wordId,
    ease,
    intervalDays,
    repetitions,
    lapses,
    dueAt,
    lastReviewedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'review_states';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReviewState> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('word_id')) {
      context.handle(
        _wordIdMeta,
        wordId.isAcceptableOrUnknown(data['word_id']!, _wordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_wordIdMeta);
    }
    if (data.containsKey('ease')) {
      context.handle(
        _easeMeta,
        ease.isAcceptableOrUnknown(data['ease']!, _easeMeta),
      );
    }
    if (data.containsKey('interval_days')) {
      context.handle(
        _intervalDaysMeta,
        intervalDays.isAcceptableOrUnknown(
          data['interval_days']!,
          _intervalDaysMeta,
        ),
      );
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    if (data.containsKey('lapses')) {
      context.handle(
        _lapsesMeta,
        lapses.isAcceptableOrUnknown(data['lapses']!, _lapsesMeta),
      );
    }
    if (data.containsKey('due_at')) {
      context.handle(
        _dueAtMeta,
        dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta),
      );
    } else if (isInserting) {
      context.missing(_dueAtMeta);
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
        _lastReviewedAtMeta,
        lastReviewedAt.isAcceptableOrUnknown(
          data['last_reviewed_at']!,
          _lastReviewedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {wordId};
  @override
  ReviewState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewState(
      wordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word_id'],
      )!,
      ease: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ease'],
      )!,
      intervalDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_days'],
      )!,
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      )!,
      lapses: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lapses'],
      )!,
      dueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_at'],
      )!,
      lastReviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed_at'],
      ),
    );
  }

  @override
  $ReviewStatesTable createAlias(String alias) {
    return $ReviewStatesTable(attachedDatabase, alias);
  }
}

class ReviewState extends DataClass implements Insertable<ReviewState> {
  final String wordId;
  final double ease;
  final int intervalDays;
  final int repetitions;
  final int lapses;
  final DateTime dueAt;
  final DateTime? lastReviewedAt;
  const ReviewState({
    required this.wordId,
    required this.ease,
    required this.intervalDays,
    required this.repetitions,
    required this.lapses,
    required this.dueAt,
    this.lastReviewedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word_id'] = Variable<String>(wordId);
    map['ease'] = Variable<double>(ease);
    map['interval_days'] = Variable<int>(intervalDays);
    map['repetitions'] = Variable<int>(repetitions);
    map['lapses'] = Variable<int>(lapses);
    map['due_at'] = Variable<DateTime>(dueAt);
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    return map;
  }

  ReviewStatesCompanion toCompanion(bool nullToAbsent) {
    return ReviewStatesCompanion(
      wordId: Value(wordId),
      ease: Value(ease),
      intervalDays: Value(intervalDays),
      repetitions: Value(repetitions),
      lapses: Value(lapses),
      dueAt: Value(dueAt),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
    );
  }

  factory ReviewState.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewState(
      wordId: serializer.fromJson<String>(json['wordId']),
      ease: serializer.fromJson<double>(json['ease']),
      intervalDays: serializer.fromJson<int>(json['intervalDays']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      lapses: serializer.fromJson<int>(json['lapses']),
      dueAt: serializer.fromJson<DateTime>(json['dueAt']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'wordId': serializer.toJson<String>(wordId),
      'ease': serializer.toJson<double>(ease),
      'intervalDays': serializer.toJson<int>(intervalDays),
      'repetitions': serializer.toJson<int>(repetitions),
      'lapses': serializer.toJson<int>(lapses),
      'dueAt': serializer.toJson<DateTime>(dueAt),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
    };
  }

  ReviewState copyWith({
    String? wordId,
    double? ease,
    int? intervalDays,
    int? repetitions,
    int? lapses,
    DateTime? dueAt,
    Value<DateTime?> lastReviewedAt = const Value.absent(),
  }) => ReviewState(
    wordId: wordId ?? this.wordId,
    ease: ease ?? this.ease,
    intervalDays: intervalDays ?? this.intervalDays,
    repetitions: repetitions ?? this.repetitions,
    lapses: lapses ?? this.lapses,
    dueAt: dueAt ?? this.dueAt,
    lastReviewedAt: lastReviewedAt.present
        ? lastReviewedAt.value
        : this.lastReviewedAt,
  );
  ReviewState copyWithCompanion(ReviewStatesCompanion data) {
    return ReviewState(
      wordId: data.wordId.present ? data.wordId.value : this.wordId,
      ease: data.ease.present ? data.ease.value : this.ease,
      intervalDays: data.intervalDays.present
          ? data.intervalDays.value
          : this.intervalDays,
      repetitions: data.repetitions.present
          ? data.repetitions.value
          : this.repetitions,
      lapses: data.lapses.present ? data.lapses.value : this.lapses,
      dueAt: data.dueAt.present ? data.dueAt.value : this.dueAt,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewState(')
          ..write('wordId: $wordId, ')
          ..write('ease: $ease, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitions: $repetitions, ')
          ..write('lapses: $lapses, ')
          ..write('dueAt: $dueAt, ')
          ..write('lastReviewedAt: $lastReviewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    wordId,
    ease,
    intervalDays,
    repetitions,
    lapses,
    dueAt,
    lastReviewedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewState &&
          other.wordId == this.wordId &&
          other.ease == this.ease &&
          other.intervalDays == this.intervalDays &&
          other.repetitions == this.repetitions &&
          other.lapses == this.lapses &&
          other.dueAt == this.dueAt &&
          other.lastReviewedAt == this.lastReviewedAt);
}

class ReviewStatesCompanion extends UpdateCompanion<ReviewState> {
  final Value<String> wordId;
  final Value<double> ease;
  final Value<int> intervalDays;
  final Value<int> repetitions;
  final Value<int> lapses;
  final Value<DateTime> dueAt;
  final Value<DateTime?> lastReviewedAt;
  final Value<int> rowid;
  const ReviewStatesCompanion({
    this.wordId = const Value.absent(),
    this.ease = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.lapses = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewStatesCompanion.insert({
    required String wordId,
    this.ease = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.lapses = const Value.absent(),
    required DateTime dueAt,
    this.lastReviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : wordId = Value(wordId),
       dueAt = Value(dueAt);
  static Insertable<ReviewState> custom({
    Expression<String>? wordId,
    Expression<double>? ease,
    Expression<int>? intervalDays,
    Expression<int>? repetitions,
    Expression<int>? lapses,
    Expression<DateTime>? dueAt,
    Expression<DateTime>? lastReviewedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (wordId != null) 'word_id': wordId,
      if (ease != null) 'ease': ease,
      if (intervalDays != null) 'interval_days': intervalDays,
      if (repetitions != null) 'repetitions': repetitions,
      if (lapses != null) 'lapses': lapses,
      if (dueAt != null) 'due_at': dueAt,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewStatesCompanion copyWith({
    Value<String>? wordId,
    Value<double>? ease,
    Value<int>? intervalDays,
    Value<int>? repetitions,
    Value<int>? lapses,
    Value<DateTime>? dueAt,
    Value<DateTime?>? lastReviewedAt,
    Value<int>? rowid,
  }) {
    return ReviewStatesCompanion(
      wordId: wordId ?? this.wordId,
      ease: ease ?? this.ease,
      intervalDays: intervalDays ?? this.intervalDays,
      repetitions: repetitions ?? this.repetitions,
      lapses: lapses ?? this.lapses,
      dueAt: dueAt ?? this.dueAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (wordId.present) {
      map['word_id'] = Variable<String>(wordId.value);
    }
    if (ease.present) {
      map['ease'] = Variable<double>(ease.value);
    }
    if (intervalDays.present) {
      map['interval_days'] = Variable<int>(intervalDays.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (lapses.present) {
      map['lapses'] = Variable<int>(lapses.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<DateTime>(dueAt.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewStatesCompanion(')
          ..write('wordId: $wordId, ')
          ..write('ease: $ease, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('repetitions: $repetitions, ')
          ..write('lapses: $lapses, ')
          ..write('dueAt: $dueAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AiCachesTable extends AiCaches with TableInfo<$AiCachesTable, AiCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    cacheKey,
    kind,
    model,
    filePath,
    payload,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_caches';
  @override
  VerificationContext validateIntegrity(
    Insertable<AiCache> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  AiCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiCache(
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AiCachesTable createAlias(String alias) {
    return $AiCachesTable(attachedDatabase, alias);
  }
}

class AiCache extends DataClass implements Insertable<AiCache> {
  final String cacheKey;
  final String kind;
  final String model;
  final String? filePath;
  final String? payload;
  final DateTime createdAt;
  const AiCache({
    required this.cacheKey,
    required this.kind,
    required this.model,
    this.filePath,
    this.payload,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cache_key'] = Variable<String>(cacheKey);
    map['kind'] = Variable<String>(kind);
    map['model'] = Variable<String>(model);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AiCachesCompanion toCompanion(bool nullToAbsent) {
    return AiCachesCompanion(
      cacheKey: Value(cacheKey),
      kind: Value(kind),
      model: Value(model),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
      createdAt: Value(createdAt),
    );
  }

  factory AiCache.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiCache(
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      kind: serializer.fromJson<String>(json['kind']),
      model: serializer.fromJson<String>(json['model']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      payload: serializer.fromJson<String?>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cacheKey': serializer.toJson<String>(cacheKey),
      'kind': serializer.toJson<String>(kind),
      'model': serializer.toJson<String>(model),
      'filePath': serializer.toJson<String?>(filePath),
      'payload': serializer.toJson<String?>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AiCache copyWith({
    String? cacheKey,
    String? kind,
    String? model,
    Value<String?> filePath = const Value.absent(),
    Value<String?> payload = const Value.absent(),
    DateTime? createdAt,
  }) => AiCache(
    cacheKey: cacheKey ?? this.cacheKey,
    kind: kind ?? this.kind,
    model: model ?? this.model,
    filePath: filePath.present ? filePath.value : this.filePath,
    payload: payload.present ? payload.value : this.payload,
    createdAt: createdAt ?? this.createdAt,
  );
  AiCache copyWithCompanion(AiCachesCompanion data) {
    return AiCache(
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      kind: data.kind.present ? data.kind.value : this.kind,
      model: data.model.present ? data.model.value : this.model,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiCache(')
          ..write('cacheKey: $cacheKey, ')
          ..write('kind: $kind, ')
          ..write('model: $model, ')
          ..write('filePath: $filePath, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(cacheKey, kind, model, filePath, payload, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiCache &&
          other.cacheKey == this.cacheKey &&
          other.kind == this.kind &&
          other.model == this.model &&
          other.filePath == this.filePath &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt);
}

class AiCachesCompanion extends UpdateCompanion<AiCache> {
  final Value<String> cacheKey;
  final Value<String> kind;
  final Value<String> model;
  final Value<String?> filePath;
  final Value<String?> payload;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AiCachesCompanion({
    this.cacheKey = const Value.absent(),
    this.kind = const Value.absent(),
    this.model = const Value.absent(),
    this.filePath = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AiCachesCompanion.insert({
    required String cacheKey,
    required String kind,
    required String model,
    this.filePath = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       kind = Value(kind),
       model = Value(model);
  static Insertable<AiCache> custom({
    Expression<String>? cacheKey,
    Expression<String>? kind,
    Expression<String>? model,
    Expression<String>? filePath,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cacheKey != null) 'cache_key': cacheKey,
      if (kind != null) 'kind': kind,
      if (model != null) 'model': model,
      if (filePath != null) 'file_path': filePath,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AiCachesCompanion copyWith({
    Value<String>? cacheKey,
    Value<String>? kind,
    Value<String>? model,
    Value<String?>? filePath,
    Value<String?>? payload,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AiCachesCompanion(
      cacheKey: cacheKey ?? this.cacheKey,
      kind: kind ?? this.kind,
      model: model ?? this.model,
      filePath: filePath ?? this.filePath,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiCachesCompanion(')
          ..write('cacheKey: $cacheKey, ')
          ..write('kind: $kind, ')
          ..write('model: $model, ')
          ..write('filePath: $filePath, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearnerProfilesTable extends LearnerProfiles
    with TableInfo<$LearnerProfilesTable, LearnerProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearnerProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cefrMeta = const VerificationMeta('cefr');
  @override
  late final GeneratedColumn<String> cefr = GeneratedColumn<String>(
    'cefr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('A2'),
  );
  static const VerificationMeta _targetLangMeta = const VerificationMeta(
    'targetLang',
  );
  @override
  late final GeneratedColumn<String> targetLang = GeneratedColumn<String>(
    'target_lang',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('en'),
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('system'),
  );
  static const VerificationMeta _placementDoneMeta = const VerificationMeta(
    'placementDone',
  );
  @override
  late final GeneratedColumn<bool> placementDone = GeneratedColumn<bool>(
    'placement_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("placement_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _seedVersionMeta = const VerificationMeta(
    'seedVersion',
  );
  @override
  late final GeneratedColumn<int> seedVersion = GeneratedColumn<int>(
    'seed_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cefr,
    targetLang,
    themeMode,
    placementDone,
    seedVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learner_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<LearnerProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cefr')) {
      context.handle(
        _cefrMeta,
        cefr.isAcceptableOrUnknown(data['cefr']!, _cefrMeta),
      );
    }
    if (data.containsKey('target_lang')) {
      context.handle(
        _targetLangMeta,
        targetLang.isAcceptableOrUnknown(data['target_lang']!, _targetLangMeta),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('placement_done')) {
      context.handle(
        _placementDoneMeta,
        placementDone.isAcceptableOrUnknown(
          data['placement_done']!,
          _placementDoneMeta,
        ),
      );
    }
    if (data.containsKey('seed_version')) {
      context.handle(
        _seedVersionMeta,
        seedVersion.isAcceptableOrUnknown(
          data['seed_version']!,
          _seedVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearnerProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearnerProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cefr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cefr'],
      )!,
      targetLang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_lang'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      placementDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}placement_done'],
      )!,
      seedVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seed_version'],
      )!,
    );
  }

  @override
  $LearnerProfilesTable createAlias(String alias) {
    return $LearnerProfilesTable(attachedDatabase, alias);
  }
}

class LearnerProfile extends DataClass implements Insertable<LearnerProfile> {
  final int id;
  final String cefr;
  final String targetLang;
  final String themeMode;
  final bool placementDone;
  final int seedVersion;
  const LearnerProfile({
    required this.id,
    required this.cefr,
    required this.targetLang,
    required this.themeMode,
    required this.placementDone,
    required this.seedVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cefr'] = Variable<String>(cefr);
    map['target_lang'] = Variable<String>(targetLang);
    map['theme_mode'] = Variable<String>(themeMode);
    map['placement_done'] = Variable<bool>(placementDone);
    map['seed_version'] = Variable<int>(seedVersion);
    return map;
  }

  LearnerProfilesCompanion toCompanion(bool nullToAbsent) {
    return LearnerProfilesCompanion(
      id: Value(id),
      cefr: Value(cefr),
      targetLang: Value(targetLang),
      themeMode: Value(themeMode),
      placementDone: Value(placementDone),
      seedVersion: Value(seedVersion),
    );
  }

  factory LearnerProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearnerProfile(
      id: serializer.fromJson<int>(json['id']),
      cefr: serializer.fromJson<String>(json['cefr']),
      targetLang: serializer.fromJson<String>(json['targetLang']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      placementDone: serializer.fromJson<bool>(json['placementDone']),
      seedVersion: serializer.fromJson<int>(json['seedVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cefr': serializer.toJson<String>(cefr),
      'targetLang': serializer.toJson<String>(targetLang),
      'themeMode': serializer.toJson<String>(themeMode),
      'placementDone': serializer.toJson<bool>(placementDone),
      'seedVersion': serializer.toJson<int>(seedVersion),
    };
  }

  LearnerProfile copyWith({
    int? id,
    String? cefr,
    String? targetLang,
    String? themeMode,
    bool? placementDone,
    int? seedVersion,
  }) => LearnerProfile(
    id: id ?? this.id,
    cefr: cefr ?? this.cefr,
    targetLang: targetLang ?? this.targetLang,
    themeMode: themeMode ?? this.themeMode,
    placementDone: placementDone ?? this.placementDone,
    seedVersion: seedVersion ?? this.seedVersion,
  );
  LearnerProfile copyWithCompanion(LearnerProfilesCompanion data) {
    return LearnerProfile(
      id: data.id.present ? data.id.value : this.id,
      cefr: data.cefr.present ? data.cefr.value : this.cefr,
      targetLang: data.targetLang.present
          ? data.targetLang.value
          : this.targetLang,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      placementDone: data.placementDone.present
          ? data.placementDone.value
          : this.placementDone,
      seedVersion: data.seedVersion.present
          ? data.seedVersion.value
          : this.seedVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearnerProfile(')
          ..write('id: $id, ')
          ..write('cefr: $cefr, ')
          ..write('targetLang: $targetLang, ')
          ..write('themeMode: $themeMode, ')
          ..write('placementDone: $placementDone, ')
          ..write('seedVersion: $seedVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, cefr, targetLang, themeMode, placementDone, seedVersion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearnerProfile &&
          other.id == this.id &&
          other.cefr == this.cefr &&
          other.targetLang == this.targetLang &&
          other.themeMode == this.themeMode &&
          other.placementDone == this.placementDone &&
          other.seedVersion == this.seedVersion);
}

class LearnerProfilesCompanion extends UpdateCompanion<LearnerProfile> {
  final Value<int> id;
  final Value<String> cefr;
  final Value<String> targetLang;
  final Value<String> themeMode;
  final Value<bool> placementDone;
  final Value<int> seedVersion;
  const LearnerProfilesCompanion({
    this.id = const Value.absent(),
    this.cefr = const Value.absent(),
    this.targetLang = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.placementDone = const Value.absent(),
    this.seedVersion = const Value.absent(),
  });
  LearnerProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.cefr = const Value.absent(),
    this.targetLang = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.placementDone = const Value.absent(),
    this.seedVersion = const Value.absent(),
  });
  static Insertable<LearnerProfile> custom({
    Expression<int>? id,
    Expression<String>? cefr,
    Expression<String>? targetLang,
    Expression<String>? themeMode,
    Expression<bool>? placementDone,
    Expression<int>? seedVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cefr != null) 'cefr': cefr,
      if (targetLang != null) 'target_lang': targetLang,
      if (themeMode != null) 'theme_mode': themeMode,
      if (placementDone != null) 'placement_done': placementDone,
      if (seedVersion != null) 'seed_version': seedVersion,
    });
  }

  LearnerProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? cefr,
    Value<String>? targetLang,
    Value<String>? themeMode,
    Value<bool>? placementDone,
    Value<int>? seedVersion,
  }) {
    return LearnerProfilesCompanion(
      id: id ?? this.id,
      cefr: cefr ?? this.cefr,
      targetLang: targetLang ?? this.targetLang,
      themeMode: themeMode ?? this.themeMode,
      placementDone: placementDone ?? this.placementDone,
      seedVersion: seedVersion ?? this.seedVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cefr.present) {
      map['cefr'] = Variable<String>(cefr.value);
    }
    if (targetLang.present) {
      map['target_lang'] = Variable<String>(targetLang.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (placementDone.present) {
      map['placement_done'] = Variable<bool>(placementDone.value);
    }
    if (seedVersion.present) {
      map['seed_version'] = Variable<int>(seedVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearnerProfilesCompanion(')
          ..write('id: $id, ')
          ..write('cefr: $cefr, ')
          ..write('targetLang: $targetLang, ')
          ..write('themeMode: $themeMode, ')
          ..write('placementDone: $placementDone, ')
          ..write('seedVersion: $seedVersion')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WordCategoriesTable wordCategories = $WordCategoriesTable(this);
  late final $WordEntriesTable wordEntries = $WordEntriesTable(this);
  late final $WordExamplesTable wordExamples = $WordExamplesTable(this);
  late final $ReviewStatesTable reviewStates = $ReviewStatesTable(this);
  late final $AiCachesTable aiCaches = $AiCachesTable(this);
  late final $LearnerProfilesTable learnerProfiles = $LearnerProfilesTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    wordCategories,
    wordEntries,
    wordExamples,
    reviewStates,
    aiCaches,
    learnerProfiles,
  ];
}

typedef $$WordCategoriesTableCreateCompanionBuilder =
    WordCategoriesCompanion Function({
      required String id,
      required String nameEn,
      required String nameTa,
      required String emoji,
      required int sortOrder,
      Value<int> rowid,
    });
typedef $$WordCategoriesTableUpdateCompanionBuilder =
    WordCategoriesCompanion Function({
      Value<String> id,
      Value<String> nameEn,
      Value<String> nameTa,
      Value<String> emoji,
      Value<int> sortOrder,
      Value<int> rowid,
    });

class $$WordCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $WordCategoriesTable> {
  $$WordCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameTa => $composableBuilder(
    column: $table.nameTa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WordCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WordCategoriesTable> {
  $$WordCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameTa => $composableBuilder(
    column: $table.nameTa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WordCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordCategoriesTable> {
  $$WordCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get nameTa =>
      $composableBuilder(column: $table.nameTa, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$WordCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordCategoriesTable,
          WordCategory,
          $$WordCategoriesTableFilterComposer,
          $$WordCategoriesTableOrderingComposer,
          $$WordCategoriesTableAnnotationComposer,
          $$WordCategoriesTableCreateCompanionBuilder,
          $$WordCategoriesTableUpdateCompanionBuilder,
          (
            WordCategory,
            BaseReferences<_$AppDatabase, $WordCategoriesTable, WordCategory>,
          ),
          WordCategory,
          PrefetchHooks Function()
        > {
  $$WordCategoriesTableTableManager(
    _$AppDatabase db,
    $WordCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String> nameTa = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WordCategoriesCompanion(
                id: id,
                nameEn: nameEn,
                nameTa: nameTa,
                emoji: emoji,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nameEn,
                required String nameTa,
                required String emoji,
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => WordCategoriesCompanion.insert(
                id: id,
                nameEn: nameEn,
                nameTa: nameTa,
                emoji: emoji,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WordCategoriesTable, WordCategory>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $WordCategoriesTable,
                    WordCategory
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WordCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordCategoriesTable,
      WordCategory,
      $$WordCategoriesTableFilterComposer,
      $$WordCategoriesTableOrderingComposer,
      $$WordCategoriesTableAnnotationComposer,
      $$WordCategoriesTableCreateCompanionBuilder,
      $$WordCategoriesTableUpdateCompanionBuilder,
      (
        WordCategory,
        BaseReferences<_$AppDatabase, $WordCategoriesTable, WordCategory>,
      ),
      WordCategory,
      PrefetchHooks Function()
    >;
typedef $$WordEntriesTableCreateCompanionBuilder =
    WordEntriesCompanion Function({
      required String id,
      required String categoryId,
      Value<String> sourceLang,
      Value<String> targetLang,
      required String tamil,
      required String transliteration,
      required String english,
      required String ipa,
      required String pronunciation,
      required String partOfSpeech,
      required String cefr,
      Value<String?> emoji,
      Value<String?> imagePath,
      Value<String?> audioPath,
      Value<String> usageNote,
      Value<String> commonMistakes,
      Value<String?> britishNote,
      Value<String?> dutchNote,
      Value<String> origin,
      Value<bool> saved,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$WordEntriesTableUpdateCompanionBuilder =
    WordEntriesCompanion Function({
      Value<String> id,
      Value<String> categoryId,
      Value<String> sourceLang,
      Value<String> targetLang,
      Value<String> tamil,
      Value<String> transliteration,
      Value<String> english,
      Value<String> ipa,
      Value<String> pronunciation,
      Value<String> partOfSpeech,
      Value<String> cefr,
      Value<String?> emoji,
      Value<String?> imagePath,
      Value<String?> audioPath,
      Value<String> usageNote,
      Value<String> commonMistakes,
      Value<String?> britishNote,
      Value<String?> dutchNote,
      Value<String> origin,
      Value<bool> saved,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$WordEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $WordEntriesTable> {
  $$WordEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceLang => $composableBuilder(
    column: $table.sourceLang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetLang => $composableBuilder(
    column: $table.targetLang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tamil => $composableBuilder(
    column: $table.tamil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transliteration => $composableBuilder(
    column: $table.transliteration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get english => $composableBuilder(
    column: $table.english,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ipa => $composableBuilder(
    column: $table.ipa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pronunciation => $composableBuilder(
    column: $table.pronunciation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cefr => $composableBuilder(
    column: $table.cefr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioPath => $composableBuilder(
    column: $table.audioPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usageNote => $composableBuilder(
    column: $table.usageNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commonMistakes => $composableBuilder(
    column: $table.commonMistakes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get britishNote => $composableBuilder(
    column: $table.britishNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dutchNote => $composableBuilder(
    column: $table.dutchNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get saved => $composableBuilder(
    column: $table.saved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WordEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WordEntriesTable> {
  $$WordEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceLang => $composableBuilder(
    column: $table.sourceLang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetLang => $composableBuilder(
    column: $table.targetLang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tamil => $composableBuilder(
    column: $table.tamil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transliteration => $composableBuilder(
    column: $table.transliteration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get english => $composableBuilder(
    column: $table.english,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ipa => $composableBuilder(
    column: $table.ipa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pronunciation => $composableBuilder(
    column: $table.pronunciation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cefr => $composableBuilder(
    column: $table.cefr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioPath => $composableBuilder(
    column: $table.audioPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usageNote => $composableBuilder(
    column: $table.usageNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commonMistakes => $composableBuilder(
    column: $table.commonMistakes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get britishNote => $composableBuilder(
    column: $table.britishNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dutchNote => $composableBuilder(
    column: $table.dutchNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get saved => $composableBuilder(
    column: $table.saved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WordEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordEntriesTable> {
  $$WordEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceLang => $composableBuilder(
    column: $table.sourceLang,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetLang => $composableBuilder(
    column: $table.targetLang,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tamil =>
      $composableBuilder(column: $table.tamil, builder: (column) => column);

  GeneratedColumn<String> get transliteration => $composableBuilder(
    column: $table.transliteration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get english =>
      $composableBuilder(column: $table.english, builder: (column) => column);

  GeneratedColumn<String> get ipa =>
      $composableBuilder(column: $table.ipa, builder: (column) => column);

  GeneratedColumn<String> get pronunciation => $composableBuilder(
    column: $table.pronunciation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cefr =>
      $composableBuilder(column: $table.cefr, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get audioPath =>
      $composableBuilder(column: $table.audioPath, builder: (column) => column);

  GeneratedColumn<String> get usageNote =>
      $composableBuilder(column: $table.usageNote, builder: (column) => column);

  GeneratedColumn<String> get commonMistakes => $composableBuilder(
    column: $table.commonMistakes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get britishNote => $composableBuilder(
    column: $table.britishNote,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dutchNote =>
      $composableBuilder(column: $table.dutchNote, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<bool> get saved =>
      $composableBuilder(column: $table.saved, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WordEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordEntriesTable,
          WordEntry,
          $$WordEntriesTableFilterComposer,
          $$WordEntriesTableOrderingComposer,
          $$WordEntriesTableAnnotationComposer,
          $$WordEntriesTableCreateCompanionBuilder,
          $$WordEntriesTableUpdateCompanionBuilder,
          (
            WordEntry,
            BaseReferences<_$AppDatabase, $WordEntriesTable, WordEntry>,
          ),
          WordEntry,
          PrefetchHooks Function()
        > {
  $$WordEntriesTableTableManager(_$AppDatabase db, $WordEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<String> sourceLang = const Value.absent(),
                Value<String> targetLang = const Value.absent(),
                Value<String> tamil = const Value.absent(),
                Value<String> transliteration = const Value.absent(),
                Value<String> english = const Value.absent(),
                Value<String> ipa = const Value.absent(),
                Value<String> pronunciation = const Value.absent(),
                Value<String> partOfSpeech = const Value.absent(),
                Value<String> cefr = const Value.absent(),
                Value<String?> emoji = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> audioPath = const Value.absent(),
                Value<String> usageNote = const Value.absent(),
                Value<String> commonMistakes = const Value.absent(),
                Value<String?> britishNote = const Value.absent(),
                Value<String?> dutchNote = const Value.absent(),
                Value<String> origin = const Value.absent(),
                Value<bool> saved = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WordEntriesCompanion(
                id: id,
                categoryId: categoryId,
                sourceLang: sourceLang,
                targetLang: targetLang,
                tamil: tamil,
                transliteration: transliteration,
                english: english,
                ipa: ipa,
                pronunciation: pronunciation,
                partOfSpeech: partOfSpeech,
                cefr: cefr,
                emoji: emoji,
                imagePath: imagePath,
                audioPath: audioPath,
                usageNote: usageNote,
                commonMistakes: commonMistakes,
                britishNote: britishNote,
                dutchNote: dutchNote,
                origin: origin,
                saved: saved,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String categoryId,
                Value<String> sourceLang = const Value.absent(),
                Value<String> targetLang = const Value.absent(),
                required String tamil,
                required String transliteration,
                required String english,
                required String ipa,
                required String pronunciation,
                required String partOfSpeech,
                required String cefr,
                Value<String?> emoji = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> audioPath = const Value.absent(),
                Value<String> usageNote = const Value.absent(),
                Value<String> commonMistakes = const Value.absent(),
                Value<String?> britishNote = const Value.absent(),
                Value<String?> dutchNote = const Value.absent(),
                Value<String> origin = const Value.absent(),
                Value<bool> saved = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WordEntriesCompanion.insert(
                id: id,
                categoryId: categoryId,
                sourceLang: sourceLang,
                targetLang: targetLang,
                tamil: tamil,
                transliteration: transliteration,
                english: english,
                ipa: ipa,
                pronunciation: pronunciation,
                partOfSpeech: partOfSpeech,
                cefr: cefr,
                emoji: emoji,
                imagePath: imagePath,
                audioPath: audioPath,
                usageNote: usageNote,
                commonMistakes: commonMistakes,
                britishNote: britishNote,
                dutchNote: dutchNote,
                origin: origin,
                saved: saved,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WordEntriesTable, WordEntry>(table),
                  BaseReferences<_$AppDatabase, $WordEntriesTable, WordEntry>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WordEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordEntriesTable,
      WordEntry,
      $$WordEntriesTableFilterComposer,
      $$WordEntriesTableOrderingComposer,
      $$WordEntriesTableAnnotationComposer,
      $$WordEntriesTableCreateCompanionBuilder,
      $$WordEntriesTableUpdateCompanionBuilder,
      (WordEntry, BaseReferences<_$AppDatabase, $WordEntriesTable, WordEntry>),
      WordEntry,
      PrefetchHooks Function()
    >;
typedef $$WordExamplesTableCreateCompanionBuilder =
    WordExamplesCompanion Function({
      Value<int> id,
      required String wordId,
      required String kind,
      required String english,
      required String tamil,
    });
typedef $$WordExamplesTableUpdateCompanionBuilder =
    WordExamplesCompanion Function({
      Value<int> id,
      Value<String> wordId,
      Value<String> kind,
      Value<String> english,
      Value<String> tamil,
    });

class $$WordExamplesTableFilterComposer
    extends Composer<_$AppDatabase, $WordExamplesTable> {
  $$WordExamplesTableFilterComposer({
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

  ColumnFilters<String> get wordId => $composableBuilder(
    column: $table.wordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get english => $composableBuilder(
    column: $table.english,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tamil => $composableBuilder(
    column: $table.tamil,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WordExamplesTableOrderingComposer
    extends Composer<_$AppDatabase, $WordExamplesTable> {
  $$WordExamplesTableOrderingComposer({
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

  ColumnOrderings<String> get wordId => $composableBuilder(
    column: $table.wordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get english => $composableBuilder(
    column: $table.english,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tamil => $composableBuilder(
    column: $table.tamil,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WordExamplesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordExamplesTable> {
  $$WordExamplesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get wordId =>
      $composableBuilder(column: $table.wordId, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get english =>
      $composableBuilder(column: $table.english, builder: (column) => column);

  GeneratedColumn<String> get tamil =>
      $composableBuilder(column: $table.tamil, builder: (column) => column);
}

class $$WordExamplesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordExamplesTable,
          WordExample,
          $$WordExamplesTableFilterComposer,
          $$WordExamplesTableOrderingComposer,
          $$WordExamplesTableAnnotationComposer,
          $$WordExamplesTableCreateCompanionBuilder,
          $$WordExamplesTableUpdateCompanionBuilder,
          (
            WordExample,
            BaseReferences<_$AppDatabase, $WordExamplesTable, WordExample>,
          ),
          WordExample,
          PrefetchHooks Function()
        > {
  $$WordExamplesTableTableManager(_$AppDatabase db, $WordExamplesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordExamplesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordExamplesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordExamplesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> wordId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> english = const Value.absent(),
                Value<String> tamil = const Value.absent(),
              }) => WordExamplesCompanion(
                id: id,
                wordId: wordId,
                kind: kind,
                english: english,
                tamil: tamil,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String wordId,
                required String kind,
                required String english,
                required String tamil,
              }) => WordExamplesCompanion.insert(
                id: id,
                wordId: wordId,
                kind: kind,
                english: english,
                tamil: tamil,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WordExamplesTable, WordExample>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $WordExamplesTable,
                    WordExample
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WordExamplesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordExamplesTable,
      WordExample,
      $$WordExamplesTableFilterComposer,
      $$WordExamplesTableOrderingComposer,
      $$WordExamplesTableAnnotationComposer,
      $$WordExamplesTableCreateCompanionBuilder,
      $$WordExamplesTableUpdateCompanionBuilder,
      (
        WordExample,
        BaseReferences<_$AppDatabase, $WordExamplesTable, WordExample>,
      ),
      WordExample,
      PrefetchHooks Function()
    >;
typedef $$ReviewStatesTableCreateCompanionBuilder =
    ReviewStatesCompanion Function({
      required String wordId,
      Value<double> ease,
      Value<int> intervalDays,
      Value<int> repetitions,
      Value<int> lapses,
      required DateTime dueAt,
      Value<DateTime?> lastReviewedAt,
      Value<int> rowid,
    });
typedef $$ReviewStatesTableUpdateCompanionBuilder =
    ReviewStatesCompanion Function({
      Value<String> wordId,
      Value<double> ease,
      Value<int> intervalDays,
      Value<int> repetitions,
      Value<int> lapses,
      Value<DateTime> dueAt,
      Value<DateTime?> lastReviewedAt,
      Value<int> rowid,
    });

class $$ReviewStatesTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewStatesTable> {
  $$ReviewStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get wordId => $composableBuilder(
    column: $table.wordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ease => $composableBuilder(
    column: $table.ease,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lapses => $composableBuilder(
    column: $table.lapses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReviewStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewStatesTable> {
  $$ReviewStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get wordId => $composableBuilder(
    column: $table.wordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ease => $composableBuilder(
    column: $table.ease,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lapses => $composableBuilder(
    column: $table.lapses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReviewStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewStatesTable> {
  $$ReviewStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get wordId =>
      $composableBuilder(column: $table.wordId, builder: (column) => column);

  GeneratedColumn<double> get ease =>
      $composableBuilder(column: $table.ease, builder: (column) => column);

  GeneratedColumn<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lapses =>
      $composableBuilder(column: $table.lapses, builder: (column) => column);

  GeneratedColumn<DateTime> get dueAt =>
      $composableBuilder(column: $table.dueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => column,
  );
}

class $$ReviewStatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewStatesTable,
          ReviewState,
          $$ReviewStatesTableFilterComposer,
          $$ReviewStatesTableOrderingComposer,
          $$ReviewStatesTableAnnotationComposer,
          $$ReviewStatesTableCreateCompanionBuilder,
          $$ReviewStatesTableUpdateCompanionBuilder,
          (
            ReviewState,
            BaseReferences<_$AppDatabase, $ReviewStatesTable, ReviewState>,
          ),
          ReviewState,
          PrefetchHooks Function()
        > {
  $$ReviewStatesTableTableManager(_$AppDatabase db, $ReviewStatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> wordId = const Value.absent(),
                Value<double> ease = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<int> lapses = const Value.absent(),
                Value<DateTime> dueAt = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewStatesCompanion(
                wordId: wordId,
                ease: ease,
                intervalDays: intervalDays,
                repetitions: repetitions,
                lapses: lapses,
                dueAt: dueAt,
                lastReviewedAt: lastReviewedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String wordId,
                Value<double> ease = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<int> lapses = const Value.absent(),
                required DateTime dueAt,
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewStatesCompanion.insert(
                wordId: wordId,
                ease: ease,
                intervalDays: intervalDays,
                repetitions: repetitions,
                lapses: lapses,
                dueAt: dueAt,
                lastReviewedAt: lastReviewedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReviewStatesTable, ReviewState>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ReviewStatesTable,
                    ReviewState
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReviewStatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewStatesTable,
      ReviewState,
      $$ReviewStatesTableFilterComposer,
      $$ReviewStatesTableOrderingComposer,
      $$ReviewStatesTableAnnotationComposer,
      $$ReviewStatesTableCreateCompanionBuilder,
      $$ReviewStatesTableUpdateCompanionBuilder,
      (
        ReviewState,
        BaseReferences<_$AppDatabase, $ReviewStatesTable, ReviewState>,
      ),
      ReviewState,
      PrefetchHooks Function()
    >;
typedef $$AiCachesTableCreateCompanionBuilder = AiCachesCompanion Function({
  required String cacheKey,
  required String kind,
  required String model,
  Value<String?> filePath,
  Value<String?> payload,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$AiCachesTableUpdateCompanionBuilder = AiCachesCompanion Function({
  Value<String> cacheKey,
  Value<String> kind,
  Value<String> model,
  Value<String?> filePath,
  Value<String?> payload,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AiCachesTableFilterComposer
    extends Composer<_$AppDatabase, $AiCachesTable> {
  $$AiCachesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AiCachesTableOrderingComposer
    extends Composer<_$AppDatabase, $AiCachesTable> {
  $$AiCachesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AiCachesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiCachesTable> {
  $$AiCachesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AiCachesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AiCachesTable,
          AiCache,
          $$AiCachesTableFilterComposer,
          $$AiCachesTableOrderingComposer,
          $$AiCachesTableAnnotationComposer,
          $$AiCachesTableCreateCompanionBuilder,
          $$AiCachesTableUpdateCompanionBuilder,
          (AiCache, BaseReferences<_$AppDatabase, $AiCachesTable, AiCache>),
          AiCache,
          PrefetchHooks Function()
        > {
  $$AiCachesTableTableManager(_$AppDatabase db, $AiCachesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiCachesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiCachesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiCachesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> cacheKey = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> model = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AiCachesCompanion(
                cacheKey: cacheKey,
                kind: kind,
                model: model,
                filePath: filePath,
                payload: payload,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cacheKey,
                required String kind,
                required String model,
                Value<String?> filePath = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AiCachesCompanion.insert(
                cacheKey: cacheKey,
                kind: kind,
                model: model,
                filePath: filePath,
                payload: payload,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AiCachesTable, AiCache>(table),
                  BaseReferences<_$AppDatabase, $AiCachesTable, AiCache>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AiCachesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AiCachesTable,
      AiCache,
      $$AiCachesTableFilterComposer,
      $$AiCachesTableOrderingComposer,
      $$AiCachesTableAnnotationComposer,
      $$AiCachesTableCreateCompanionBuilder,
      $$AiCachesTableUpdateCompanionBuilder,
      (AiCache, BaseReferences<_$AppDatabase, $AiCachesTable, AiCache>),
      AiCache,
      PrefetchHooks Function()
    >;
typedef $$LearnerProfilesTableCreateCompanionBuilder =
    LearnerProfilesCompanion Function({
      Value<int> id,
      Value<String> cefr,
      Value<String> targetLang,
      Value<String> themeMode,
      Value<bool> placementDone,
      Value<int> seedVersion,
    });
typedef $$LearnerProfilesTableUpdateCompanionBuilder =
    LearnerProfilesCompanion Function({
      Value<int> id,
      Value<String> cefr,
      Value<String> targetLang,
      Value<String> themeMode,
      Value<bool> placementDone,
      Value<int> seedVersion,
    });

class $$LearnerProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $LearnerProfilesTable> {
  $$LearnerProfilesTableFilterComposer({
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

  ColumnFilters<String> get cefr => $composableBuilder(
    column: $table.cefr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetLang => $composableBuilder(
    column: $table.targetLang,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get placementDone => $composableBuilder(
    column: $table.placementDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LearnerProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $LearnerProfilesTable> {
  $$LearnerProfilesTableOrderingComposer({
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

  ColumnOrderings<String> get cefr => $composableBuilder(
    column: $table.cefr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetLang => $composableBuilder(
    column: $table.targetLang,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get placementDone => $composableBuilder(
    column: $table.placementDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LearnerProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearnerProfilesTable> {
  $$LearnerProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cefr =>
      $composableBuilder(column: $table.cefr, builder: (column) => column);

  GeneratedColumn<String> get targetLang => $composableBuilder(
    column: $table.targetLang,
    builder: (column) => column,
  );

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<bool> get placementDone => $composableBuilder(
    column: $table.placementDone,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => column,
  );
}

class $$LearnerProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LearnerProfilesTable,
          LearnerProfile,
          $$LearnerProfilesTableFilterComposer,
          $$LearnerProfilesTableOrderingComposer,
          $$LearnerProfilesTableAnnotationComposer,
          $$LearnerProfilesTableCreateCompanionBuilder,
          $$LearnerProfilesTableUpdateCompanionBuilder,
          (
            LearnerProfile,
            BaseReferences<
              _$AppDatabase,
              $LearnerProfilesTable,
              LearnerProfile
            >,
          ),
          LearnerProfile,
          PrefetchHooks Function()
        > {
  $$LearnerProfilesTableTableManager(
    _$AppDatabase db,
    $LearnerProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearnerProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearnerProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearnerProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> cefr = const Value.absent(),
                Value<String> targetLang = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<bool> placementDone = const Value.absent(),
                Value<int> seedVersion = const Value.absent(),
              }) => LearnerProfilesCompanion(
                id: id,
                cefr: cefr,
                targetLang: targetLang,
                themeMode: themeMode,
                placementDone: placementDone,
                seedVersion: seedVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> cefr = const Value.absent(),
                Value<String> targetLang = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<bool> placementDone = const Value.absent(),
                Value<int> seedVersion = const Value.absent(),
              }) => LearnerProfilesCompanion.insert(
                id: id,
                cefr: cefr,
                targetLang: targetLang,
                themeMode: themeMode,
                placementDone: placementDone,
                seedVersion: seedVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LearnerProfilesTable, LearnerProfile>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $LearnerProfilesTable,
                    LearnerProfile
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LearnerProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LearnerProfilesTable,
      LearnerProfile,
      $$LearnerProfilesTableFilterComposer,
      $$LearnerProfilesTableOrderingComposer,
      $$LearnerProfilesTableAnnotationComposer,
      $$LearnerProfilesTableCreateCompanionBuilder,
      $$LearnerProfilesTableUpdateCompanionBuilder,
      (
        LearnerProfile,
        BaseReferences<_$AppDatabase, $LearnerProfilesTable, LearnerProfile>,
      ),
      LearnerProfile,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WordCategoriesTableTableManager get wordCategories =>
      $$WordCategoriesTableTableManager(_db, _db.wordCategories);
  $$WordEntriesTableTableManager get wordEntries =>
      $$WordEntriesTableTableManager(_db, _db.wordEntries);
  $$WordExamplesTableTableManager get wordExamples =>
      $$WordExamplesTableTableManager(_db, _db.wordExamples);
  $$ReviewStatesTableTableManager get reviewStates =>
      $$ReviewStatesTableTableManager(_db, _db.reviewStates);
  $$AiCachesTableTableManager get aiCaches =>
      $$AiCachesTableTableManager(_db, _db.aiCaches);
  $$LearnerProfilesTableTableManager get learnerProfiles =>
      $$LearnerProfilesTableTableManager(_db, _db.learnerProfiles);
}
