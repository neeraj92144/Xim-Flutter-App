import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/screens/home_screen.dart';
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
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
              ],
            ),
          ),

          // Custom TabBar at the bottom
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
                bool isSelected = controller.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () => controller.changeTab(index),
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
          ),
        ],
      ),
    );
  }
}



