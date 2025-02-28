import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/screens/home_screen.dart';
import '../../view_models/controller/tab_bar_controller.dart';

class TabBarComponent extends StatelessWidget {

  final TabScreenController controller = Get.find<TabScreenController>(); // Fetching GetX controller

  // Constructor to receive the controller
  TabBarComponent(TabScreenController controller, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller.tabController,
        children: const [
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}



