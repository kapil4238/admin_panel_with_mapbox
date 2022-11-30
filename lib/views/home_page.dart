import 'package:aegis247_admin_panel/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HomePage extends GetView<HomeScreenController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapboxMap(
            accessToken: controller.mapBoxToken,
            initialCameraPosition: controller.initialCameraPosition,
            myLocationEnabled: true,
            doubleClickZoomEnabled: false,
          ),
          SizedBox(
            child: Flow(
              delegate: FlowMenuDelegate(menuAnimation: controller.menuAnimation),
              children: controller.menuItems
                  .map<Widget>((IconData icon) =>
                  RowIcons(
                    iconData: icon,
                  ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class RowIcons extends GetView<HomeScreenController> {
  IconData iconData;

  RowIcons({
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RawMaterialButton(
        fillColor: controller.lastTapped.value == iconData ? Colors.purple : Colors.black,
        splashColor: Colors.amber[100],
        shape: const CircleBorder(),
        onPressed: () {
          controller.updateMenu(iconData);
        },
        child: Icon(
          iconData,
          color: Colors.white,
          size: 20.0,
        ),
      );
    });
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation}) : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = context.childCount-1; i >=0; i--) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx * menuAnimation.value,
          0,
          0,
        ),
      );
    }
  }
}
