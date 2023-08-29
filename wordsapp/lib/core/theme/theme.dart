import 'package:flutter/material.dart';

import '../utils/color.dart';

class AppTheme {
  static ThemeData data = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            width: 1.8,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            width: 1.8,
            color: Color(0xFF34A48E),
          ),
        )),
    visualDensity: VisualDensity.compact,
    primaryColor: AppColors.colorBackgroundFooter,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: const TextStyle(fontSize: 20, color: Colors.white),
        ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.colorCustomGreen,
      backgroundColor: AppColors.corDoCardDosCampos,
    ),
  );
}
