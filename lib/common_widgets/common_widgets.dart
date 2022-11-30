import 'package:aegis247_admin_panel/services/utility_service.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../app/app_colors.dart';
import '../app/app_text_style.dart';


class CommonWidgets {
  static iconWidget({String? imagePath,
    Key? key,
    Color? iconColor,
    double? imageWidth,
    double? imageHeight,
    Function()? onTap}) {
    return InkWell(
      onTap: onTap ??
              () {
            Get.back();
          },
      child: Padding(
        padding: const EdgeInsets.only(
            top:10,
            bottom: 10,
            right: 10),
        child: Image.asset(
          imagePath!,
          color: iconColor,
          key: key,
          width: imageWidth,
          height: imageHeight,
        ),
      ),
    );
  }
  Widget phoneNumber(TextEditingController value, {FocusNode? focus}) {
    return TextField(
      controller: value,
      focusNode: focus,
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ], // Only numbers can be entered
      style: AppTextStyle.openSansRegular
          .copyWith(color: AppColors.textColor70, fontSize: getFontSize(context: Get.context!, fontSize: 16)),
      decoration: InputDecoration(
          isDense: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          helperStyle:
          TextStyle(fontSize:  getFontSize(context: Get.context!, fontSize: 16), color: AppColors.gray)),
    );
  }
  void openCountryPickerDialog(Function(Country) onChange) {
    Get.dialog(CountryPickerDialog(
      titlePadding: EdgeInsets.all(8),
      searchCursorColor: AppColors.blackColor,
      searchInputDecoration: InputDecoration(hintText: 'Search...'),
      isSearchable: true,
      title: Text('Select your country code'),
      onValuePicked: (Country country) => onChange(country),
      itemBuilder: buildDialogItem,
      priorityList: [
        CountryPickerUtils.getCountryByIsoCode('US'),
        CountryPickerUtils.getCountryByIsoCode('TR'),
      ],
    ));
  }
  Widget buildDialogItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      SizedBox(width: 8.0),
      Text(
        "+${country.phoneCode}",
        style: AppTextStyle.openSansSemiBold.copyWith(
            fontSize: getFontSize(context: Get.context!, fontSize: 13), color: AppColors.textColor70),
      ),
      SizedBox(width: 8.0),
      Flexible(
          child: Text(
            country.name,
            style: AppTextStyle.openSansSemiBold.copyWith(
                fontSize: getFontSize(context: Get.context!, fontSize: 13), color: AppColors.textColor70),
          ))
    ],
  );
}