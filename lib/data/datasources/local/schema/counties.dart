import 'package:drift/drift.dart';

@DataClassName('CountyData')
class Counties extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}
