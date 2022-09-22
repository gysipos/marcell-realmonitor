import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realmonitor/data/datasources/mock/repositories/mock_notifications_repository.dart';
import 'package:realmonitor/domain/repositories/notifications_repository.dart';

class MockDatasource extends StatelessWidget {
  final Widget child;

  const MockDatasource(this.child);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<NotificationsRepository>(
      create: (_) => MockNotificationsRepository(),
      lazy: false,
      child: child,
    );
  }
}
