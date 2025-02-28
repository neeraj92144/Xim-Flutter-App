import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import 'package:ximapp/screens/home_screen.dart';
import '../../res/assets/image_assets.dart';
import '../../res/routes/routes_name.dart';
import '../../view_models/controller/home_controller.dart';
import '../../view_models/controller/tab_bar_controller.dart';

class HomeUserList extends StatelessWidget {

  final HomeController homeController = Get.find<HomeController>(); // Fetching GetX controller

  // Constructor to receive the controller
  HomeUserList(HomeController controller, {super.key}); // Constructor


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(
                context,
              )!.translate(LangKeys.goldLevel),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF616161),
              ),
            ),
          ),
        ),

        SizedBox(height: 5),

        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of (
                context,
              )!.translate(LangKeys.bestReviewer),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

        SizedBox(
          height: 120,
          child: Obx( () =>
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeController.userList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      var params = {
                        "img": homeController.userList[index].img,
                        "userName": homeController.userList[index].userName
                      };
                      Get.toNamed ( RouteName.reviewProfileScreen, arguments: params );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 16,
                        right: index == (homeController.userList.length - 1) ? 16 : 0,
                      ),
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              homeController.userList[index].img,
                              width: 62, // Match CircleAvatar's size
                              height: 62, // Match CircleAvatar's size
                              fit: BoxFit.cover, // Adjust fit to avoid distortion
                            ),
                          ),

                          SizedBox(height: 5),
                          Text(homeController.userList[index].userName),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ),
        ),
      ],
    );

  }
}







