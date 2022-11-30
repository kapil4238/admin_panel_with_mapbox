

import 'package:aegis247_admin_panel/app/app_font_family.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTextStyle {
  // Small style

  static TextStyle get openSansRegular => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.fontOpenSans);

  static TextStyle get openSansSemiBold => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.fontOpenSans);

  static TextStyle get openSansBold => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.fontOpenSans);

  static TextStyle get openSansExtraBold => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.fontOpenSans);

  static TextStyle get montserratRegular => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.fontMontserrat);

  static TextStyle get montserratMedium => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.fontMontserrat);

  static TextStyle get montserratSemiBold => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.fontMontserrat);

  static TextStyle get montserratBold => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.fontMontserrat);

  static TextStyle get bebasNeueBold => TextStyle(
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.fontBebasNeue);
}