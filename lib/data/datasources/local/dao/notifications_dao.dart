import 'package:drift/drift.dart';
import 'package:realmonitor/data/datasources/local/database/local_database.dart';
import 'package:realmonitor/data/datasources/models/city_model.dart';
import 'package:realmonitor/data/datasources/models/county_model.dart';
import 'package:realmonitor/data/datasources/models/notification_model.dart';
import 'package:realmonitor/domain/entities/estate_type.dart';
import 'package:realmonitor/domain/entities/notification.dart';
import 'package:realmonitor/domain/repositories/notifications_repository.dart';
import 'package:realmonitor/utils/immutable_list.dart';

class NotificationsDao extends DatabaseAccessor<LocalDatabase>
    implements NotificationsRepository {
  NotificationsDao(super.database);

  @override
  Future<Stream<List<Notification>>> watchNotifications() async {
    // Concatenate EstateType IDs are more performant than create a second query
    final estateTypes = db.notificationEstateTypes.estateType.groupConcat();

    final query = select(db.notifications).join([
      innerJoin(db.cities, db.cities.id.equalsExp(db.notifications.cityId)),
      innerJoin(db.counties, db.counties.id.equalsExp(db.cities.countyId)),
      innerJoin(
        db.notificationEstateTypes,
        db.notificationEstateTypes.notificationId
            .equalsExp(db.notifications.id),
        useColumns: false,
      ),
    ])
      ..addColumns([estateTypes])
      ..groupBy([db.notifications.id]);

    return query.map((row) {
      final county = CountyModel.fromData(row.readTable(db.counties));
      final city = CityModel.fromData(row.readTable(db.cities), county);
      final notification = row.readTable(db.notifications);
      final types = row
          .read(estateTypes)!
          .split(',')
          .map((index) => EstateType.values[int.parse(index)]);

      return NotificationModel.fromData(
          notification, city, ImmutableList(types));
    }).watch();
  }

  @override
  Future<void> setEnabled(Notification notification,
      {required bool enabled}) async {
    final query = update(db.notifications)
      ..where((t) => t.id.equals(notification.id));
    await query.write(NotificationDataCompanion(isEnabled: Value(enabled)));
  }

  @override
  Future<void> deleteEntity(Notification notification) async {
    final query = db.delete(db.notifications)
      ..where((t) => t.id.equals(notification.id));
    await query.go();
  }
}
