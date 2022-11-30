import 'package:aegis247_admin_panel/app/app_pages.dart';
import 'package:aegis247_admin_panel/app/app_router.dart';
import 'package:aegis247_admin_panel/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as Responsive;

import '../app/app_colors.dart';
import '../app/app_icons.dart';
import '../app/app_images.dart';
import '../app/app_text_style.dart';
import '../common_widgets/common_widgets.dart';
import '../common_widgets/single_icon_widget.dart';
import '../res/strings/str_keys.dart';
import '../services/utility_service.dart';

class LoginScreen extends GetView<AuthScreenController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Responsive.ResponsiveRowColumn(
          rowMainAxisAlignment: MainAxisAlignment.center,
          layout: Responsive.ResponsiveWrapper.of(context).isSmallerThan(Responsive.DESKTOP)
              ? Responsive.ResponsiveRowColumnType.COLUMN
              : Responsive.ResponsiveRowColumnType.COLUMN,
          children: [
            Responsive.ResponsiveRowColumnItem(
              child: BlackLayer(
                txtTitle: StringKeys.loginTitle.tr,
                txtMessage1: StringKeys.loginMessage.tr,
                txtMessage2: StringKeys.loginMessage2.tr,
                txtMessage2bold: StringKeys.loginMessage2Bold.tr,
                onTextTapEvent: () {},
                backIconTap: () {
                  Get.back();
                },
              ),
            ),
            Responsive.ResponsiveRowColumnItem(
              child: WhiteLoginLayer(),
            ),
          ],
        ),
      ),
    );
  }
}

class BlackLayer extends StatelessWidget {
  final String txtTitle, txtMessage1, txtMessage2, txtMessage2bold;
  final Function()? onTextTapEvent;
  final Function()? backIconTap;

  const BlackLayer(
      {Key? key,
      this.txtTitle = '',
      this.txtMessage1 = '',
      this.txtMessage2 = '',
      this.txtMessage2bold = '',
      this.onTextTapEvent,
      this.backIconTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          ///Other Widgets
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Back icon
                  CommonWidgets.iconWidget(
                      imagePath: AppImage.iconArrowBack, imageHeight: 15, imageWidth: 9, onTap: backIconTap),

                  ///Logo icon
                  Container(
                    margin: const EdgeInsets.only(top: (24)),
                    child: CommonWidgets.iconWidget(
                      imagePath: AppImage.iconLogo,
                      imageHeight: 70,
                      imageWidth: 50,
                    ),
                  ),
                  // SizedBox(height: (28)),

                  ///Title
                  Container(
                    margin: const EdgeInsets.only(top: (30)),
                    child: Text(
                      txtTitle,
                      style: AppTextStyle.montserratRegular.copyWith(color: AppColors.whiteTextColor.withOpacity(0.45)),
                    ),
                  ),

                  ///Message 1
                  Container(
                    margin: const EdgeInsets.only(top: (8)),
                    child: Text(
                      txtMessage1,
                      style: AppTextStyle.montserratBold.copyWith(
                        color: AppColors.whiteTextColor,
                        fontSize: getFontSize(context: context, fontSize: 28),
                      ),
                    ),
                  ),

                  ///Divider
                  Container(
                    height: 1.0,
                    margin: const EdgeInsets.only(top: (30)),
                    width: MediaQuery.of(context).size.width / 4.5,
                    color: Colors.white.withOpacity(0.3),
                  ),

                  ///Message 2
                  Container(
                    margin: const EdgeInsets.only(top: (20)),
                    child: InkWell(
                      onTap: () {
                        onTextTapEvent?.call();
                      },
                      child: RichText(
                          text: TextSpan(
                              style: AppTextStyle.openSansRegular.copyWith(
                                color: AppColors.whiteTextColor,
                                fontSize: getFontSize(context: context, fontSize: 16),
                              ),
                              children: [
                            TextSpan(text: txtMessage2),
                            TextSpan(
                                text: txtMessage2bold,
                                style: AppTextStyle.openSansExtraBold.copyWith(
                                  color: AppColors.whiteTextColor,
                                  fontSize: getFontSize(context: context, fontSize: 16),
                                )),
                          ])),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteLoginLayer extends GetView<AuthScreenController> {
  WhiteLoginLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(width: 0, color: Colors.white),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
        ),
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          height: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: (20)),
              ///Phone Number Filed
              Text(StringKeys.signUPPhNo.tr,
                  style: AppTextStyle.openSansExtraBold.copyWith(fontSize: getFontSize(context: context, fontSize: 13))),
              _phoneNumber(),
              Divider(
                height: 1,
                color: AppColors.gray,
              ),
              SizedBox(
                height: 25,
              ),

              ///Password Filed
              Row(
                children: [
                  Text(StringKeys.signUPPassword.tr,
                      style:
                          AppTextStyle.openSansExtraBold.copyWith(fontSize: getFontSize(context: context, fontSize: 13))),
                  SizedBox(
                    width: 2,
                  ),
                  Text(StringKeys.signUPPasswordInfo.tr,
                      style: AppTextStyle.openSansExtraBold.copyWith(
                          fontSize: getFontSize(context: context, fontSize: 9), color: AppColors.greyTextColor)),
                ],
              ),
              Obx(() => TextField(
                    controller: controller.loginPasswordController.value,
                    obscureText: controller.isLoginHidden.value,
                    style: AppTextStyle.openSansRegular
                        .copyWith(color: AppColors.textColor70, fontSize: getFontSize(context: context, fontSize: 16)),
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        isDense: true,
                        suffixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
                        suffixIcon: InkWell(
                            onTap: () {
                              controller.isLoginHidden.value = !controller.isLoginHidden.value;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                              child: controller.isLoginHidden.value
                                  ? SvgPicture.asset(
                                      AppIcons.iconEye,
                                    )
                                  : SvgPicture.asset(
                                      AppIcons.eyeOffIcon,
                                    ),
                            )),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        helperStyle:
                            TextStyle(fontSize: getFontSize(context: context, fontSize: 16), color: AppColors.gray)),
                  )),
              Divider(
                height: 1,
                color: AppColors.gray,
              ),
              SizedBox(
                height: 20,
              ),

              InkWell(
                onTap: () {
                  controller.forgotPhoneNoController.value.text = '';
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(StringKeys.loginForgotPassword.tr,
                      style:
                          AppTextStyle.openSansRegular.copyWith(fontSize: getFontSize(context: context, fontSize: 16))),
                ),
              ),
              SizedBox(height: (36)),
              AppButton(
                isEnabled: false,
                showBorder: true,
                buttonWidth: 500,
                fontSize: getFontSize(context: context, fontSize: 18),
                focusNode: controller.loginButtonFocusNode.value,
                buttonText: StringKeys.signInTitle.tr,
                buttonTapEvent: () async {
                  navigateTo(Routes.home);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // Phone Number
  Widget _phoneNumber() {
    return Row(
      children: [
        InkWell(
          onTap: () => controller.selectCountyDialog(),
          child: Row(
            children: <Widget>[
              Obx(
                () => Text(
                  "+${controller.selectedCountry.value.phoneCode}",
                  style: AppTextStyle.openSansRegular.copyWith(
                      fontSize: getFontSize(context: Get.context!, fontSize: 16), color: AppColors.textColor70),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: (18.0),
                color: AppColors.textColor70,
              ),
            ],
          ),
        ),
        Expanded(
          child: CommonWidgets().phoneNumber(controller.loginPhoneController.value),
        ),
      ],
    );
  }
}
