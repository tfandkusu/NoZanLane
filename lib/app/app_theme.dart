import 'package:flutter/material.dart';

/// NoZanLane 全体で利用するライトテーマです。
final appLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
  ),
);

/// NoZanLane 全体で利用するダークテーマです。
final appDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    brightness: Brightness.dark,
  ),
);
