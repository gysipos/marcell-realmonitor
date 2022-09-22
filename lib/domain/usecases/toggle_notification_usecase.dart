import 'package:realmonitor/domain/entities/notification.dart';
import 'package:realmonitor/domain/repositories/notifications_repository.dart';

class ToggleNotificationUseCase {
  final NotificationsRepository _repository;

  const ToggleNotificationUseCase(this._repository);

  Future<void> toggleEnabled(Notification notification) {
    return _repository.setEnabled(notification,
        enabled: !notification.isEnabled);
  }
}
