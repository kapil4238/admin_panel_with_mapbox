import 'package:aegis247_admin_panel/controllers/home_screen_controller.dart';
import 'package:aegis247_admin_panel/controllers/auth_controller.dart';
import 'package:aegis247_admin_panel/views/error_page.dart';
import 'package:aegis247_admin_panel/views/home_page.dart';
import 'package:aegis247_admin_panel/views/auth_screen.dart';
import 'package:get/get.dart';

import 'app_pages.dart';

class AppPages {
  static final AppPages _singleton = AppPages._internal();

  factory AppPages() {
    return _singleton;
  }

  AppPages._internal();

  static String initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      bindings: [SplashBinding()],
      preventDuplicates: true,
      unknownRoute: GetPage(
        name: Routes.error,
        page: () => const ErrorPage(),
      ),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      bindings: [HomeBinding()],
      preventDuplicates: true,
      maintainState: true,
      unknownRoute: GetPage(
        name: Routes.error,
        page: () => const ErrorPage(),
      ),
    ),
  ];
}

/// Navigate function
Future navigateTo(String screen,
    {Transition? transition,
    bool clearStack = false,
    bool offCurrentScreen = false,
    bool preventDuplicates = true,
    Duration? duration,
    dynamic arguments,
    bool offToName = false,
    bool offNameUntil = false}) async {
  if (clearStack) {
    return Get.offAllNamed(screen);
  } else if (offCurrentScreen) {
    return Get.offNamed(screen);
  } else if (offToName) {
    return Get.offAndToNamed(screen, arguments: arguments);
  } else if (offNameUntil) {
    return Get.offNamedUntil(screen, (route) => false);
  } else {
    return Get.toNamed(screen, arguments: arguments, preventDuplicates: preventDuplicates);
  }
}
