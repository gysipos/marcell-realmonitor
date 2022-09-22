import 'package:realmonitor/domain/entities/notification.dart';

abstract class NotificationsRepository {
  Future<Stream<List<Notification>>> watchNotifications();
  Future<void> setEnabled(Notification notification, {required bool enabled});
  Future<void> deleteEntity(Notification notification);
}
