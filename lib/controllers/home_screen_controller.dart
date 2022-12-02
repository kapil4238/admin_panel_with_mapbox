import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final String mapBoxToken =
      "pk.eyJ1Ijoia2FwaWwtc29uaSIsImEiOiJjbDhiNzF0ZHcwbXNlM3VxazNlY3U1NmR4In0.o8KK2FvDMXXicFrZjWRxYQ";
  final CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(23.00, 72.00), zoom: 11);
  RxInt drawerTabIndex = 0.obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  set center(int tab) {
    drawerTabIndex.value = tab;
  }
}
