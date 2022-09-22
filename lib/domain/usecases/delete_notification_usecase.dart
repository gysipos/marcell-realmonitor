import 'package:realmonitor/domain/entities/notification.dart';
import 'package:realmonitor/domain/repositories/notifications_repository.dart';

class DeleteNotificationUseCase {
  final NotificationsRepository _repository;

  const DeleteNotificationUseCase(this._repository);

  Future<void> deleteNotification(Notification notification) {
    return _repository.deleteEntity(notification);
  }
}
