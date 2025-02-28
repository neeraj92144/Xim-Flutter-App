import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import 'package:ximapp/screens/home_screen.dart';
import '../../res/assets/image_assets.dart';
import '../../view_models/controller/home_controller.dart';
import '../../view_models/controller/tab_bar_controller.dart';

class ImageSlider extends StatelessWidget {

  final HomeController homeController = Get.find<HomeController>(); // Fetching GetX controller

  // Constructor to receive the controller
  ImageSlider(HomeController controller, {super.key}); // Constructor


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: Stack(
        children: [
          Obx(() =>
              CarouselSlider(
                carouselController: homeController.controller.value, // Assign controller
                options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true, // Auto slide
                  enlargeCenterPage: false, // Zoom effect on center
                  onPageChanged: (index, reason) {
                    homeController.currentIndex.value = index;
                  },

                  viewportFraction:
                  1, // Makes each image take full width (No space)
                  // showIndicator: true, // Enable built-in indicator
                  // indicatorBgPadding: 10.0, // Padding for indicator
                ),
                items:
                homeController.bannerImages.value.asMap().entries.map((entry) {
                  int index = entry.key;
                  var data = entry.value;
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin:
                        EdgeInsets
                            .zero, // No margin to avoid gaps
                        child: Image.asset(
                          data,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
          ),
          // SizedBox(height: 16),

          // Dots Indicator
          Positioned(
            bottom: 10, // 10 pixels from the bottom
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Obx( () =>
                  AnimatedSmoothIndicator(
                    activeIndex: homeController.currentIndex.value,
                    count: homeController.bannerImages.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 7,
                      dotWidth: 7,
                      activeDotColor:
                      Colors.white, // Active dot color
                      dotColor: Colors.white.withAlpha(
                        100,
                      ), // Inactive dot color
                    ),
                    onDotClicked: (index) {
                      homeController.controller.value.animateToPage(
                        index,
                      ); // Click to jump to page
                    },
                  ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}



