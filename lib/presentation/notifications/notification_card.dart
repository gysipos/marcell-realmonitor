import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realmonitor/application/styles.dart';
import 'package:realmonitor/domain/entities/assignment_type.dart';
import 'package:realmonitor/domain/entities/estate_type.dart';
import 'package:realmonitor/domain/entities/notification.dart' as entity;
import 'package:realmonitor/presentation/notifications/notifications_controller.dart';
import 'package:realmonitor/presentation/widgets/app_icon_button.dart';
import 'package:realmonitor/utils/utils.dart';

part 'notification_models.dart';

class NotificationCard extends StatelessWidget {
  final entity.Notification notification;

  const NotificationCard(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
      padding: const EdgeInsets.only(left: 26, top: 20, right: 26, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(_HeaderModel.from(notification)),
          _Info(_InfoModel.from(notification)),
          _ActionButtons(
            notificationEnabled: notification.isEnabled,
            onDeletePressed: () {
              context
                  .read<NotificationsController>()
                  .deleteNotification(notification);
            },
            onNotificationPressed: () {
              context
                  .read<NotificationsController>()
                  .toggleNotificationEnabled(notification);
            },
            onEditPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final _HeaderModel model;

  const _Header(this.model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            model.subTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final _InfoModel model;

  const _Info(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 6),
      decoration: const BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Text(model.location, style: FontStyle.infoBox),
          ),
          if (model.price != null)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: AppColors.dividerColor),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text('Ár', style: FontStyle.infoBoxSecondary),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(model.price!, style: FontStyle.infoBox),
                  ),
                ],
              ),
            ),
          if (model.floorSize != null)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: AppColors.dividerColor),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child:
                        Text('Alapterület', style: FontStyle.infoBoxSecondary),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(model.floorSize!, style: FontStyle.infoBox),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final bool notificationEnabled;
  final VoidCallback onDeletePressed;
  final VoidCallback onNotificationPressed;
  final VoidCallback onEditPressed;

  const _ActionButtons({
    required this.notificationEnabled,
    required this.onDeletePressed,
    required this.onNotificationPressed,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppIconButton(Icons.delete, onDeletePressed),
        AppIconButton(
            notificationEnabled ? Icons.notifications : Icons.notifications_off,
            onNotificationPressed),
        AppIconButton(Icons.edit, onEditPressed),
      ],
    );
  }
}
