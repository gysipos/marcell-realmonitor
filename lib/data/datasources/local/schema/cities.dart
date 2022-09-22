import 'package:drift/drift.dart';
import 'package:realmonitor/data/datasources/local/schema/countries.dart';

@DataClassName('CityData')
class Cities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  IntColumn get countryId => integer().references(Countries, #id)();
}
