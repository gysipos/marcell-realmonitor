import 'dart:async';

import 'package:flutter/widgets.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realmonitor/domain/entities/notification.dart';
import 'package:realmonitor/domain/usecases/delete_notification_usecase.dart';
import 'package:realmonitor/domain/usecases/notification_list_usecase.dart';
import 'package:realmonitor/domain/usecases/toggle_notification_usecase.dart';
import 'package:realmonitor/utils/load_state.dart';

typedef NotificationList = List<Notification>;
typedef NotificationListStream = Stream<NotificationList>;
typedef NotificationListState = LoadState<NotificationList>;

class NotificationsController extends Cubit<NotificationListState> {
  static const int loadTimeout = 28;
  static const int reloadInterval = 30;

  final NotificationListUseCase _listUseCase;
  final DeleteNotificationUseCase _deleteUseCase;
  final ToggleNotificationUseCase _toggleUseCase;

  StreamSubscription<NotificationList>? _subscription;

  NotificationsController(flutter.BuildContext context)
      : _listUseCase = NotificationListUseCase(context.read()),
        _deleteUseCase = DeleteNotificationUseCase(context.read()),
        _toggleUseCase = ToggleNotificationUseCase(context.read()),
        super(const LoadState.loading()) {
    scheduleMicrotask(_load);
  }

  Future<void> _load() async {
    emit(const LoadState.loading());
    await _subscription?.cancel();

    try {
      _subscription = (await _listUseCase.watchNotifications()).listen(
        (NotificationList data) {
          if (data.isEmpty) {
            emit(const LoadState.empty());
          } else {
            emit(LoadState.success(data));
          }
        },
        onError: (Object error) => emit(LoadState.error(error)),
      );
    } on Exception catch (ex) {
      emit(LoadState.error(ex));
    }
  }

  void toggleNotificationEnabled(Notification notification) {
    _toggleUseCase.toggleEnabled(notification);
  }

  void deleteNotification(Notification notification) {
    _deleteUseCase.deleteNotification(notification);
  }

  @override
  void emit(NotificationListState state) {
    if (state.isError) {
      flutter.debugPrint(state.error.toString());
    }
    super.emit(state);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _subscription = null;
    return super.close();
  }
}
