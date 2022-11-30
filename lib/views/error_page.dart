import 'package:aegis247_admin_panel/services/utility_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app/app_colors.dart';
import '../app/app_images.dart';
import '../app/app_text_style.dart';
import '../common_widgets/single_icon_widget.dart';
import '../res/strings/str_keys.dart';

class ErrorPage extends StatelessWidget {
  final String? error;
  const ErrorPage({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Align(alignment: Alignment.topLeft, child: BackButtonWidget()),
              SizedBox(
                height: 100,
              ),
              Expanded(
                child: SizedBox(
                  height: 330,
                  child: Center(
                    child: SvgPicture.asset(AppImage.illustration),
                  ),
                ),
              ),

              Text(
                StringKeys.whoops.tr,
                style: AppTextStyle.montserratBold
                    .copyWith( fontSize: getFontSize(context: context, fontSize: 24),),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                StringKeys.errorOccured.tr,
                style: AppTextStyle.openSansRegular.copyWith(
                  fontSize: getFontSize(context: context, fontSize: 16),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width:200,
                height: 50,
                child: AppButton(
                    buttonText: StringKeys.tryagain.tr,
                    isEnabled: false,
                    showBorder: true,
                    buttonTapEvent: () {
                      Get.back();
                    },
                    fontSize: getFontSize(context: context, fontSize: 18),
                    borderRadius: 10),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
