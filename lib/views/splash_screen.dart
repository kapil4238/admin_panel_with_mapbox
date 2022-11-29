import 'package:aegis247_admin_panel/app/app_pages.dart';
import 'package:aegis247_admin_panel/app/app_router.dart';
import 'package:aegis247_admin_panel/controllers/splash_controller.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                navigateTo(Routes.home);
              },
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
