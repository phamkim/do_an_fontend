import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './views/constance.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const primary = Color(0xFFB980F0);
  static const secondary = Color(0xFFFE9898);

  static const textHighDark = secondary;
  static const textHighLight = secondary;

  static const accentLight = Color(0xFFF5E79D);
  static const accentDark = Color(0xFFA5C9CA);

  static const textDark = Color(0xFF000000);
  static const textLight = Color(0xFFFFFFFF);

  static const textFaded = Color(0xFF9899A5);

  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);

  static const cardLight = Color(0xFFF4F6F1);
  static const cardDark = Color(0xFF303334);

  static const appBarDark = Color(0xFF303334);
  static const appBarLight = Color(0xFFFFFFFF);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF000000);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  /// Light theme and its settings.
  ThemeData get light => ThemeData(
        primaryColor: AppColors.primary,
        focusColor: AppColors.secondary,
        brightness: Brightness.light,
        highlightColor: AppColors.secondary,
        colorScheme:
            lightBase.colorScheme.copyWith(secondary: AppColors.secondary),
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
        backgroundColor: _LightColors.background,
        appBarTheme: lightBase.appBarTheme.copyWith(
          iconTheme: lightBase.iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: AppColors.textDark,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.secondary,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: AppColors.textDark),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          suffixIconColor: AppColors.primary,
          prefixIconColor: AppColors.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: AppColors.primary),
        ),
      );

  /// Dark theme and its settings.
  ThemeData get dark => ThemeData(
        primaryColor: AppColors.primary,
        focusColor: AppColors.secondary,
        highlightColor: AppColors.secondary,
        brightness: Brightness.dark,
        colorScheme:
            darkBase.colorScheme.copyWith(secondary: AppColors.secondary),
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLight),
        backgroundColor: _DarkColors.background,
        appBarTheme: darkBase.appBarTheme.copyWith(
          backgroundColor: AppColors.appBarDark,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textLight,
            fontSize: 17,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLight),
        ),
        iconTheme: const IconThemeData(color: AppColors.secondary),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: AppColors.textLight,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: AppColors.primary),
        ),
      );
}
