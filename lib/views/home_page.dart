import 'package:aegis247_admin_panel/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../app/app_colors.dart';
import '../app/app_images.dart';
import '../app/app_text_style.dart';
import '../common_widgets/common_widgets.dart';
import '../services/utility_service.dart';

class HomePage extends GetView<HomeScreenController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        actions: <Widget>[
          CommonWidgets.iconWidget(
            imagePath: AppImage.iconLogo,
            imageHeight: 70,
            imageWidth: 50,
          ),
        ],
        title: Row(),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        elevation: 20,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            //DrawerHeader
            ListTile(
              leading: const Icon(
                Icons.person,
                color: AppColors.backgroundColor,
              ),
              title: Text(
                "Account",
                style: AppTextStyle.openSansRegular.copyWith(
                  color: AppColors.whiteTextColor,
                  fontSize: getFontSize(context: context, fontSize: 16),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.location_on,
                color: AppColors.backgroundColor,
              ),
              title:Text(
                "Risk Area",
                style: AppTextStyle.openSansRegular.copyWith(
                  color: AppColors.whiteTextColor,
                  fontSize: getFontSize(context: context, fontSize: 16),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.workspace_premium,
                color: AppColors.backgroundColor,
              ),
              title: Text(
                "Current plan",
                style: AppTextStyle.openSansRegular.copyWith(
                  color: AppColors.whiteTextColor,
                  fontSize: getFontSize(context: context, fontSize: 16),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: AppColors.backgroundColor,
              ),
              title: Text(
                "Settings",
                style: AppTextStyle.openSansRegular.copyWith(
                  color: AppColors.whiteTextColor,
                  fontSize: getFontSize(context: context, fontSize: 16),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: AppColors.backgroundColor,
              ),
              title: Text(
                "Log-out",
                style: AppTextStyle.openSansRegular.copyWith(
                  color: AppColors.whiteTextColor,
                  fontSize: getFontSize(context: context, fontSize: 16),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          MapboxMap(
            accessToken: controller.mapBoxToken,
            initialCameraPosition: controller.initialCameraPosition,
            myLocationEnabled: true,
            doubleClickZoomEnabled: false,
          ),
        ],
      ),
    );
  }
}
