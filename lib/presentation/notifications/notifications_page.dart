import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realmonitor/presentation/notifications/notification_card.dart';
import 'package:realmonitor/presentation/notifications/notifications_controller.dart';
import 'package:realmonitor/utils/load_state.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: NotificationsController.new,
      child: Scaffold(
        appBar: AppBar(title: const Text('Realmonitor')),
        body: BlocBuilder<NotificationsController, NotificationListState>(
          builder: (context, state) {
            switch (state.status) {
              case LoadStatus.empty:
                return const Center(
                    child: Text('Nincsenek beállított értesítések!'));
                break;
              case LoadStatus.loading:
                return const Center(child: Text('Betöltés...'));
                break;
              case LoadStatus.success:
                return _NotificationsList(state);
                break;
              case LoadStatus.error:
                return Center(child: Text(state.error.toString()));
                break;
            }
          },
        ),
      ),
    );
  }
}

class _NotificationsList extends StatelessWidget {
  final NotificationListState state;

  const _NotificationsList(this.state);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.value.length,
      itemBuilder: (context, index) {
        final item = state.value[index];
        return NotificationCard(item, key: ValueKey(item.id));
      },
    );
  }
}
