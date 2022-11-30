

import 'package:aegis247_admin_panel/res/strings/str_en.dart';
import 'package:aegis247_admin_panel/res/strings/str_keys.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

Map<String, String> stringsDe = {
  StringKeys.appTitle: 'financier',
};
class StringUtils extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': stringsEn,
    'hi_IN': stringsDe,
  };
}