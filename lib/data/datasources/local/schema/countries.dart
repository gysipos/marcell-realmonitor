import 'package:drift/drift.dart';

@DataClassName('CountryData')
class Countries extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get iso => text()();
  TextColumn get name => text()();
}
