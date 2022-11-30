import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/common_widgets.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthScreenController>(() => AuthScreenController());
  }
}

class AuthScreenController extends GetxController {
  ///Login Account Controllers
  var isLoginTap = false.obs;
  final loginPhoneController = TextEditingController().obs;
  final loginPasswordController = TextEditingController().obs;
  final loginButtonFocusNode = FocusNode().obs;
  final RxBool isLoginHidden = true.obs;

  ///Create Account Controllers
  final signupNameController = TextEditingController().obs;
  final signupEmailController = TextEditingController().obs;
  final signUpPasswordController = TextEditingController().obs;
  final signupPhoneNoController = TextEditingController().obs;
  final isAcceptTerm = false.obs;
  final isAcceptPrivacy = false.obs;

  final phoneNumberFocusNode = FocusNode().obs;
  final signUpFieldFocusNode = FocusNode().obs;
  final RxBool isHidden = true.obs;
  final RxBool termsChecked = false.obs;
  final RxBool passwordVisible = false.obs;
  final RxString countryDialCode = '+1'.obs;
  final RxString country2DCode = "".obs;
  var selectedCountry = CountryPickerUtils.getCountryByIsoCode('US').obs;

  ///OTP verify Controller
  final verificationCodeFieldFocusNode = FocusNode().obs;
  final textOtpController = TextEditingController().obs;
  final RxBool editOptionClicked = false.obs;
  var focusNode = FocusNode().obs;

  /// Forgot Password
  final forgotPhoneNoController = TextEditingController().obs;
  var newPasswordTextController = TextEditingController().obs;
  var confirmPasswordTextController = TextEditingController().obs;
  var isNewPasswordHide = true.obs;
  var isConfirmPasswordHide = true.obs;

  void selectCountyDialog() {
    CommonWidgets().openCountryPickerDialog((value) {
      selectedCountry.value = value;

      country2DCode.value = value.isoCode;
      countryDialCode.value = "+" + value.phoneCode;
    });
  }
}
