import 'package:drift/drift.dart';
import 'package:realmonitor/data/datasources/local/schema/counties.dart';

@DataClassName('CityData')
class Cities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  IntColumn get countyId => integer().references(Counties, #id)();
}
