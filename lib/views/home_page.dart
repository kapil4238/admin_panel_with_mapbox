import 'package:aegis247_admin_panel/controllers/home_screen_controller.dart';
import 'package:aegis247_admin_panel/views/dashboard_view.dart';
import 'package:aegis247_admin_panel/views/map_views.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

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
        title: TabBar(
          isScrollable: true,
          indicatorColor: AppColors.backgroundColor,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
          controller: controller.tabController,
          mouseCursor: MouseCursor.uncontrolled,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.dashboard),
            ),
            Tab(
              icon: Icon(Icons.map),
            ),
            Tab(
              icon: Icon(Icons.dangerous_sharp),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        elevation: 20,
        child: ListView(
          children: [
            //DrawerHeader
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration:
                    const BoxDecoration(color: AppColors.backgroundColor),

                accountName: const Text(
                  "",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: AppColors.blackColor),
                ),
                accountEmail: Text("kapssoni333@gmail.com",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.openSansExtraBold.copyWith(
                        fontSize: getFontSize(context: context, fontSize: 15),
                        color: AppColors.blackColor)),

                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: AppColors.blackColor,
                  child: Text(
                    "K",
                    style: TextStyle(
                        fontSize: 30.0, color: AppColors.backgroundColor),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //D
            DrawerListTiles(
              iconData: Icons.group,
              tileName: "Group",
              function: () {},
            ),
            DrawerListTiles(
              iconData: Icons.lightbulb_sharp,
              tileName: "Ideas",
              function: () {},
            ),
            DrawerListTiles(
              iconData: Icons.location_on,
              tileName: "Risk management",
              function: () {},
            ),
            Container(
              height: 0.3,
              width: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: AppColors.gray,
              ),
            ),
            DrawerListTiles(
              iconData: Icons.subscriptions,
              tileName: "Subsciption",
              function: () {},
            ),
            DrawerListTiles(
              iconData: Icons.settings,
              tileName: "Settings",
              function: () {},
            ),
            DrawerListTiles(
              iconData: Icons.logout,
              tileName: "Log-out",
              function: () {},
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const <Widget>[
          HomeScreenDashboardView(),
          HomeScreenMapView(),
          Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }
}

class DrawerListTiles extends StatelessWidget {
  final IconData iconData;
  final String tileName;
  final Function() function;
  const DrawerListTiles(
      {required this.iconData,
      required this.tileName,
      required this.function,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: AppColors.backgroundColor,
      ),
      title: Text(
        tileName,
        style: AppTextStyle.openSansRegular.copyWith(
          color: AppColors.whiteTextColor,
          fontSize: getFontSize(context: context, fontSize: 16),
        ),
      ),
      onTap: function,
    );
  }
}
