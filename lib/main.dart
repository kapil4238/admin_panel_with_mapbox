import 'dart:async';

import 'package:aegis247_admin_panel/app/app_router.dart';
import 'package:aegis247_admin_panel/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runZonedGuarded(() {
    runApp(const AegisAdminPanel());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.$error');
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
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
    );
  }
}
