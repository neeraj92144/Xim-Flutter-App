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

class HomeProductList extends StatelessWidget {

  final HomeController homeController = Get.find<HomeController>(); // Fetching GetX controller

  // Constructor to receive the controller
  HomeProductList(HomeController controller, {super.key}); // Constructor


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 16),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(
                context,
              )!.translate(LangKeys.hotReview),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF616161),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(
                    context,
                  )!.translate(LangKeys.top3Review),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
          ),

          SizedBox(height: 16),
          Obx( () =>
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.productList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom:
                        index != (homeController.productList.length - 1)
                            ? 18
                            : 0,
                      ),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start, // Align to top
                        children: [
                          Image.asset(
                            homeController.productList[index].img,
                            height: 104,
                            width: 104,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 12,
                          ), // Spacing between image and text
                          Expanded(
                            // Allow text to take available space
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2,
                                ), // Spacing between image and text

                                Text(
                                  homeController.productList[index].prodTitle,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF1D1D1D),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "• " + homeController.productList[index].prodDesc,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF1D1D1D),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "• " + homeController.productList[index].prodDesc2,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF1D1D1D),
                                  ),
                                ),
                                SizedBox(height: 4),

                                Row(
                                  children: [
                                    Image.asset(
                                      ImageAssets.star,
                                      height: 12,
                                      width: 12,
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      homeController.productList[index].rating
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFFFD233),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      "(${homeController.productList[index].noOfRating.toString()})",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFC4C4C4),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 4),

                                Row(
                                  children: [
                                    Container(
                                      height: 21,
                                      width: 42,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6),
                                        color: Color(0xFFF0F0F0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          homeController.productList[index].prodCat1,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF868686),
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Container(
                                      height: 21,
                                      width: 42,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6),
                                        color: Color(0xFFF0F0F0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          homeController.productList[index].prodCat2,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF868686),
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  );
                },
              ),
          ),
        ],
      ),
    );

  }
}



