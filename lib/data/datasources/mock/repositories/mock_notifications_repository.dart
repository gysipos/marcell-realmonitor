import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:realmonitor/data/datasources/mock/data/mock_%20notifications_data.dart';
import 'package:realmonitor/data/datasources/models/notification_model.dart';
import 'package:realmonitor/data/datasources/remote/dto/notifications_dto.dart';
import 'package:realmonitor/domain/entities/notification.dart';
import 'package:realmonitor/domain/repositories/notifications_repository.dart';

class MockNotificationsRepository implements NotificationsRepository {
  final SplayTreeSet<NotificationModel> notifications = SplayTreeSet.from(
    mockNotificationsSource.map<NotificationModel>(
      (json) => NotificationModel.fromDto(
        NotificationDto.fromMap(jsonDecode(json) as Map<String, dynamic>),
      ),
    ),
    (left, right) => left.id.compareTo(right.id),
  );

  StreamController<List<Notification>>? _streamController;

  @override
  Future<Stream<List<Notification>>> watchNotifications() async {
    await _streamController?.close();
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    _streamController = StreamController();
    _streamController!.add(notifications.toList());
    return _streamController!.stream;
  }

  @override
  Future<void> deleteEntity(Notification notification) async {
    notifications.remove(notification);
    _streamController!.add(notifications.toList());
  }

  @override
  Future<void> setEnabled(Notification notification,
      {required bool enabled}) async {
    notifications.remove(notification);
    notifications.add((notification as NotificationModel)
        .copyWith(isEnabled: !notification.isEnabled));
    _streamController!.add(notifications.toList());
  }
}
