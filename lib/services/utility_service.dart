import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

double? getFontSize({required BuildContext context, required double fontSize}) {
  return ResponsiveValue(
    context,
    defaultValue: fontSize,
    valueWhen: [
      Condition.smallerThan(
        name: MOBILE,
        value: fontSize,
      ),
      Condition.largerThan(
        name: TABLET,
        value: fontSize * 1.05,
      ),
    ],
  ).value;
}

class DebugPrints {
  static final DebugPrints _singleton = DebugPrints._internal();

  factory DebugPrints() {
    return _singleton;
  }

  DebugPrints._internal();

  static final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      // number of method calls to be displayed
      errorMethodCount: 8,
      // number of method calls if stacktrace is provided
      lineLength: 120,
      // width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
      // Print an emoji for each log message
      printTime: true, // Should each log print contain a timestamp
    ),
  );

  static log(String args) {
    if (kDebugMode) {
      logger.d("Logger is working!");
    }
  }
}
