import 'package:drift/drift.dart';

class WordCategories extends Table {
  TextColumn get id => text()();
  TextColumn get nameEn => text()();
  TextColumn get nameTa => text()();
  TextColumn get emoji => text()();
  IntColumn get sortOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class WordEntries extends Table {
  TextColumn get id => text()();
  TextColumn get categoryId => text()();
  TextColumn get sourceLang => text().withDefault(const Constant('ta'))();
  TextColumn get targetLang => text().withDefault(const Constant('en'))();
  TextColumn get tamil => text()();
  TextColumn get transliteration => text()();
  TextColumn get english => text()();
  TextColumn get ipa => text()();
  TextColumn get pronunciation => text()();
  TextColumn get partOfSpeech => text()();
  TextColumn get cefr => text()();
  TextColumn get emoji => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get audioPath => text().nullable()();
  TextColumn get usageNote => text().withDefault(const Constant(''))();
  TextColumn get commonMistakes => text().withDefault(const Constant(''))();
  TextColumn get britishNote => text().nullable()();
  TextColumn get dutchNote => text().nullable()();
  TextColumn get origin => text().withDefault(const Constant('seed'))();
  BoolColumn get saved => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class WordExamples extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get wordId => text()();
  TextColumn get kind => text()();
  TextColumn get english => text()();
  TextColumn get tamil => text()();
}

/// SM-2 schedule. Created when a word is saved. Review UI comes later.
class ReviewStates extends Table {
  TextColumn get wordId => text()();
  RealColumn get ease => real().withDefault(const Constant(2.5))();
  IntColumn get intervalDays => integer().withDefault(const Constant(0))();
  IntColumn get repetitions => integer().withDefault(const Constant(0))();
  IntColumn get lapses => integer().withDefault(const Constant(0))();
  DateTimeColumn get dueAt => dateTime()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {wordId};
}

class AiCaches extends Table {
  TextColumn get cacheKey => text()();
  TextColumn get kind => text()();
  TextColumn get model => text()();
  TextColumn get filePath => text().nullable()();
  TextColumn get payload => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {cacheKey};
}

class LearnerProfiles extends Table {
  IntColumn get id => integer()();
  TextColumn get cefr => text().withDefault(const Constant('A2'))();
  TextColumn get targetLang => text().withDefault(const Constant('en'))();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  BoolColumn get placementDone => boolean().withDefault(const Constant(false))();
  IntColumn get seedVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
