import 'package:drift/drift.dart';
import 'package:realmonitor/data/datasources/local/schema/cities.dart';
import 'package:realmonitor/domain/entities/assignment_type.dart';
import 'package:realmonitor/domain/entities/estate_type.dart';

@DataClassName('NotificationData')
class Notifications extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  IntColumn get assignmentType => intEnum<AssignmentType>()();
  IntColumn get cityId => integer().references(Cities, #id)();

  IntColumn get minFloorArea => integer().nullable()();
  IntColumn get maxFloorArea => integer().nullable()();

  IntColumn get minPrice => integer().nullable()();
  IntColumn get maxPrice => integer().nullable()();

  BoolColumn get isEnabled => boolean()();
}

@DataClassName('NotificationEstateTypesModel')
class NotificationEstateTypes extends Table {
  IntColumn get notificationId => integer().references(Notifications, #id)();
  IntColumn get estateType => intEnum<EstateType>()();

  @override
  Set<Column<Object>> get primaryKey => {notificationId, estateType};
}
