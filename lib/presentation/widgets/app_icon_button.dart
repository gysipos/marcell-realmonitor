import 'package:flutter/material.dart';
import 'package:realmonitor/application/styles.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AppIconButton(this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashRadius: 24,
        icon: Icon(icon, size: 32, color: AppColors.primaryColor),
        onPressed: onPressed,
      ),
    );
  }
}
