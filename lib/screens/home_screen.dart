import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/model/ProductModel.dart';
import 'package:ximapp/model/UserModel.dart';
import 'package:ximapp/res/assets/image_assets.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import 'package:ximapp/res/routes/routes_name.dart';

import '../view_models/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeController.setupView(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          kToolbarHeight,
        ), // Standard AppBar height
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color of AppBar
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                blurRadius: 4, // Softness of shadow
                spreadRadius: 2, // How much the shadow expands
                offset: Offset(0, 2), // Shadow direction (horizontal, vertical)
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0, // Remove default shadow
            title: const Text(
              "LOGO",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // physics : NeverScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [Color(0xFF6ADAD9), Color(0xFF4153C2)],
                          ),
                        ),
                        padding: EdgeInsets.all(
                          2,
                        ), // Padding for border thickness
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:
                            Colors.white, // Background color of TextField
                          ),
                          child: TextField(
                            cursorColor: Color(0xFF6ADAD9),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(
                                context,
                              )!.translate(LangKeys.searchHint),
                              suffixIcon: Icon(Icons.search, size: 42),
                              suffixIconColor: Color(0xFF4153C2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                BorderSide.none, // Remove default border
                              ),
                              filled: true,
                              fillColor:
                              Colors.white, // Match inner container color
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ), // Adjust height
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
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
                  ),

                  Padding(
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
                  ),
                ],
              ),

              Container(height: 14, color: Color(0xFFeeeeee)),

              Column(
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
              ),

              Container(
                height: 210,
                width: double.infinity,
                color: Color(0xFFeeeeee),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.translate(LangKeys.companyName),
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF868686),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    SizedBox(
                      height: 20,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return
                            Container(
                              width:
                              ((MediaQuery.sizeOf(context).width - 32) / 4) - 4,
                              child: Row(
                                mainAxisAlignment: index == 0 ? MainAxisAlignment.spaceBetween :
                                index == 3 ? MainAxisAlignment.end :
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.translate(LangKeys.aboutUs),
                                    textAlign: index == 0 ? TextAlign.start : TextAlign.center  ,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF868686),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  index == 3 ? SizedBox.shrink() :
                                  Text(
                                    "|",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF868686),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                        },
                      ),
                    ),

                    SizedBox(height: 24),

                    Row(
                      children: [
                        Image.asset(ImageAssets.send, height: 25, width: 16,),
                        SizedBox(width: 2),

                        Text(
                          AppLocalizations.of(
                            context,
                          )!.translate(LangKeys.reviewEmail),
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF868686),

                          ),


                        ),

                        Expanded(child: Container()),

                        Container(
                          height: 17,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.5),
                            border: Border.all(color: Color(0xFF868686), width : 1 ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  "KOR",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF868686),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_drop_down, size: 10, color: Color(0xFF868686))
                              ],
                            ),
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 9),

                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: Color(0xFFC8C8C8),
                    ),

                    SizedBox(height: 14),

                    Text(
                      "@2022-2022 LOGO Lab, Inc. ${AppLocalizations.of(
                        context,
                      )!.translate(LangKeys.bottom)}",
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF868686),
                      ),
                    ),

                    SizedBox(height: 24),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

