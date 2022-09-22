import 'package:realmonitor/domain/entities/notification.dart';
import 'package:realmonitor/domain/repositories/notifications_repository.dart';

class NotificationListUseCase {
  final NotificationsRepository _repository;

  const NotificationListUseCase(this._repository);

  Future<Stream<List<Notification>>> watchNotifications() {
    return _repository.watchNotifications();
  }
}
