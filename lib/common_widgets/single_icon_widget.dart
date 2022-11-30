import 'package:aegis247_admin_panel/services/utility_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/app_colors.dart';
import '../app/app_text_style.dart';


enum DynamicTextStyle { bold, medium, monoMedium }

class AppButton extends StatelessWidget {
  final bool? isEnabled;
  final bool? showBorder;
  final bool? showStar;
  final String? buttonText;
  final Function()? buttonTapEvent;
  final FocusNode? focusNode;
  final double? borderRadius;
  final double? fontSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final DynamicTextStyle? dynamicTextStyle;

  const AppButton(
      {Key? key,
        this.isEnabled = false,
        this.buttonText = '',
        this.buttonTapEvent,
        this.focusNode,
        this.borderRadius = 10,
        this.fontSize,
        this.buttonHeight,
        this.buttonWidth,
        this.showBorder = false,
        this.showStar = false,
        this.dynamicTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (focusNode != null) {
          focusNode!.unfocus();
        }
        buttonTapEvent?.call();
      },
      child: Center(
        child: Container(
          width: buttonWidth ?? MediaQuery.of(context).size.width,
          height: buttonHeight ?? 55,
          decoration: BoxDecoration(
            color: isEnabled! ? AppColors.backgroundColor : AppColors.blackColor,
            borderRadius: BorderRadius.circular(
              borderRadius!,
            ),
            border: showBorder! ? Border.all(color: AppColors.blackColor) : Border.all(color: AppColors.backgroundColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(buttonText!.capitalizeFirst!, style: textStyle(dynamicTextStyle)),
              Text(
                showStar! ? "*" : "",
                style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.redColor, fontSize:getFontSize(context: context, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle(value) {
    switch (value) {
      case DynamicTextStyle.bold:
        return AppTextStyle.openSansExtraBold.copyWith(
            color: isEnabled! ? AppColors.blackTextColor : AppColors.backgroundColor,
            fontSize: fontSize,
            letterSpacing: 1.2);
        break;
      case DynamicTextStyle.medium:
        return AppTextStyle.openSansBold.copyWith(
            color: isEnabled! ? AppColors.blackTextColor : AppColors.backgroundColor,
            fontSize: fontSize,
            letterSpacing: 1.2);
        break;
      case DynamicTextStyle.monoMedium:
        return AppTextStyle.montserratSemiBold.copyWith(
            color: isEnabled! ? AppColors.blackTextColor : AppColors.backgroundColor,
            fontSize: fontSize,
            letterSpacing: 1.2);
        break;
      default:
        return AppTextStyle.openSansExtraBold.copyWith(
            color: isEnabled! ? AppColors.blackTextColor : AppColors.backgroundColor,
            fontSize: fontSize,
            letterSpacing: 1.2);
        break;
    }
  }
}
