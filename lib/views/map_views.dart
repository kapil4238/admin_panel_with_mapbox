import 'package:aegis247_admin_panel/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HomeScreenMapView extends GetView<HomeScreenController> {
  const HomeScreenMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      accessToken: controller.mapBoxToken,
      initialCameraPosition: controller.initialCameraPosition,
      myLocationEnabled: true,
      doubleClickZoomEnabled: false,
    );
  }
}
