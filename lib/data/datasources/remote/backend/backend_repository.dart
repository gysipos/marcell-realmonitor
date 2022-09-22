import 'package:realmonitor/domain/entities/notification.dart';
import 'package:realmonitor/domain/repositories/notifications_repository.dart';

class RemoteNotificationRepository implements NotificationsRepository {
  @override
  Future<Stream<List<Notification>>> watchNotifications() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEntity(Notification notification) {
    throw UnimplementedError();
  }

  @override
  Future<void> setEnabled(Notification notification, {required bool enabled}) {
    throw UnimplementedError();
  }
}
