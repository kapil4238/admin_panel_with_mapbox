import 'dart:async';

import 'package:aegis247_admin_panel/app/app_router.dart';
import 'package:aegis247_admin_panel/controllers/auth_controller.dart';
import 'package:aegis247_admin_panel/res/strings/str_de.dart';
import 'package:aegis247_admin_panel/services/utility_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runZonedGuarded(() {
    runApp(const AegisAdminPanel());
  }, (error, stackTrace) {
    DebugPrints.log('runZonedGuarded: Caught error in my root zone.$error');
  });
}

class AegisAdminPanel extends StatefulWidget {
  const AegisAdminPanel({Key? key}) : super(key: key);

  @override
  State<AegisAdminPanel> createState() => _AegisAdminPanelState();
}

class _AegisAdminPanelState extends State<AegisAdminPanel> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1700,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
      translations: StringUtils(),
      locale: const Locale('en', 'US'),
    );
  }
}
