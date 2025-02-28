import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/screens/home_screen.dart';
import '../components/tab_bar/custom_tab_bar_component.dart';
import '../components/tab_bar/tab_bar_component.dart';
import '../view_models/controller/tab_bar_controller.dart';
import 'package:ximapp/res/assets/image_assets.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';

class TabScreen extends StatelessWidget {
  final TabScreenController controller = Get.put(TabScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background
      body: Column(
        children: [
          TabBarComponent(controller),
          CustomTabBarComponent(controller),
        ],
      ),
    );
  }
}



