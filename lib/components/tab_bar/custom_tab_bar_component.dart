import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import 'package:ximapp/screens/home_screen.dart';
import '../../res/assets/image_assets.dart';
import '../../view_models/controller/tab_bar_controller.dart';

class CustomTabBarComponent extends StatelessWidget {

  final TabScreenController controller = Get.find<TabScreenController>(); // Fetching GetX controller

  // Constructor to receive the controller
  CustomTabBarComponent(TabScreenController controller, {super.key}); // Constructor


  @override
  Widget build(BuildContext context) {
    return // Custom TabBar at the bottom
      Container(
        height: 90, // 🔥 Increased height
        padding: const EdgeInsets.symmetric(vertical: 12), // Adjust padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -2), // Shadow above the TabBar
            ),
          ],
        ),
        child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            bool isSelected = controller?.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller?.changeTab(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    index == 0 ? ImageAssets.homeTabImg :
                    index == 1 ? ImageAssets.categoryTabImg :
                    index == 2 ? ImageAssets.communityTabImg : ImageAssets.myPageTabImg,
                    width: 25,
                    height: 25,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    index == 0 ? AppLocalizations.of(context,)!.translate(LangKeys.homeTab) :
                    index == 1 ? AppLocalizations.of(context,)!.translate(LangKeys.categoryTab) :
                    index == 2 ? AppLocalizations.of(context,)!.translate(LangKeys.communityTab) :
                    AppLocalizations.of(context,)!.translate(LangKeys.myPageTab),
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }),
        )),
      );
  }
}



