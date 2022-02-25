import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static final ThemeData defaultTheme = ThemeData();

  static var textTitle = Get.textTheme.headline5?.copyWith(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 48,
  );

  static var textBody = Get.textTheme.bodyMedium?.copyWith(color: Colors.white70);
}
