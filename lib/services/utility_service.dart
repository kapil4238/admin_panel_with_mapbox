import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

double? getFontSize({
 required BuildContext context,
  required double fontSize
}) {
  return ResponsiveValue(
    context,
    defaultValue: fontSize,
    valueWhen:  [
      Condition.smallerThan(
        name: MOBILE,
        value: fontSize,
      ),
      Condition.largerThan(
        name: TABLET,
        value: fontSize*1.05,
      ),
    ],
  ).value;
}