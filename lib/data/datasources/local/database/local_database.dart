import 'package:drift/drift.dart';
import 'package:realmonitor/data/datasources/local/schema/cities.dart';
import 'package:realmonitor/data/datasources/local/schema/counties.dart';
import 'package:realmonitor/data/datasources/local/schema/notifications.dart';
import 'package:realmonitor/domain/entities/assignment_type.dart';
import 'package:realmonitor/domain/entities/estate_type.dart';

part 'local_database.g.dart';

@DriftDatabase(
  tables: [
    Cities,
    Counties,
    Notifications,
    NotificationEstateTypes,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          for (final table in allTables.toList().reversed) {
            await m.deleteTable(table.actualTableName);
          }
          await m.createAll();
          await _runMigration0();
        },
        onUpgrade: (m, from, to) async {
          for (final table in allTables.toList().reversed) {
            await m.deleteTable(table.actualTableName);
          }
          await m.createAll();
          await _runMigration0();
        },
        beforeOpen: (openingDetails) async {},
      );

  Future<void> _runMigration0() async {
    /*var user = AppUser(id: '1', name: 'user', password: 'password');
    await into(appUserTable).insert(user.toCompanion());
    var company = AppCompany(id: '1', user: user.ref);
    await into(appCompanyTable).insert(company.toCompanion());*/
  }
}
