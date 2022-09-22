import 'package:flutter/cupertino.dart';

mixin FontStyle {
  static const infoBox =
      TextStyle(fontSize: 17, overflow: TextOverflow.ellipsis);

  static const infoBoxSecondary = TextStyle(
      fontSize: 18,
      color: AppColors.textColorSecondary,
      overflow: TextOverflow.ellipsis);
}

mixin AppColors {
  static const primaryColor = Color(0xFF013867);
  static const textColor = Color(0xFF1f2121);
  static const textColorSecondary = Color(0xFF334155);
  static const surfaceColor = Color(0xFFf3f6fa);
  static const dividerColor = Color(0xFFd6d9dd);
}
