
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/model/ProductModel.dart';
import 'package:ximapp/model/UserModel.dart';
import 'package:ximapp/res/assets/image_assets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import 'package:ximapp/view_models/controller/reviewer_profile_controller.dart';

class ReviewerProfileScreen extends StatefulWidget {

  // String img;
  // String userName;required this.userName, required this.img

  ReviewerProfileScreen({Key? key, }) : super(key: key);

  @override
  State<ReviewerProfileScreen> createState() => _ReviewerProfileScreenState();
}

class _ReviewerProfileScreenState extends State<ReviewerProfileScreen> {


  double _userRating = 4.0;
  IconData? _selectedIcon;
  var catList = [];
  final reviewerProfileController = Get.put(ReviewerProfileController());



  @override
  void didChangeDependencies() {

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    var params = Get.arguments as Map<String, String>;
    reviewerProfileController.img.value = params["img"] ?? "";
    reviewerProfileController.userName.value = params["userName"] ?? "";
    catList = [
      UserModel(img: "", userName: AppLocalizations.of(context,)!.translate(LangKeys.cat1)),
      UserModel(img: "", userName: AppLocalizations.of(context,)!.translate(LangKeys.cat2)),
      UserModel(img: "", userName: AppLocalizations.of(context,)!.translate(LangKeys.cat3)),
      UserModel(img: "", userName: AppLocalizations.of(context,)!.translate(LangKeys.cat4)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(ImageAssets.back, width: 21.001340866088867, height: 13.501893997192383,),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(children: [
          Text(AppLocalizations.of(context,)!.translate(LangKeys.profileTitle), style: TextStyle(color: Color(0xFF868686) , fontSize: 10)),
          Text(AppLocalizations.of(
            context,
          )!.translate(LangKeys.profileTitleSub), style: TextStyle(color: Color(0xFF1D1D1D) , fontSize: 16))
        ],),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  ClipOval(
                    child: Obx(
                      () => Image.asset(
                        reviewerProfileController.img.value,
                        width: 120, // Match CircleAvatar's size
                        height: 120, // Match CircleAvatar's size
                        fit: BoxFit.cover, // Adjust fit to avoid distortion
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx( () => Text(
                      reviewerProfileController.userName.value,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageAssets.crown),
                      const SizedBox(width: 3),

                      Text(AppLocalizations.of(context,)!.translate(LangKeys.gold),
                        style: TextStyle(color: Color(0xFFFFD233), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color(0xFFF0F0F0),
                      ),
                      margin: EdgeInsets.only(
                          left:  MediaQuery.of(context).size.width * .15,
                          right:  MediaQuery.of(context).size.width * .15
                      ),
                      child: Center(child: Text(
                        AppLocalizations.of(context,)!.translate(LangKeys.profileDesc),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF868686)
                        ),
                      )
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 28,),
            Container(height: 14, color: Color(0xFFeeeeee)),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  SizedBox(width: 2),

                  Text(
                    AppLocalizations.of(
                      context,
                    )!.translate(LangKeys.reviewReturn),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,

                    ),
                  ),
                  SizedBox(width: 4),

                  Text(
                    AppLocalizations.of(
                      context,
                    )!.translate(LangKeys.piece),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF616161),

                    ),
                  ),

                  Expanded(child: Container()),

                  Container(
                    height: 23,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.5),
                      border: Border.all(color: Color(0xFF868686), width : 1 ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(
                              context,
                            )!.translate(LangKeys.filterLatest),
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF868686),
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_drop_down, size: 13, color: Color(0xFF868686))
                        ],
                      ),
                    ),

                  )
                ],
              ),
            ),

            Container(height: 1, color: Color(0xFFeeeeee)),
            SizedBox(height: 16,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start, // Align to top
                children: [
                  Image.asset(
                      ImageAssets.reviewReturn, fit : BoxFit.cover, width: 104, height: 104
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
                          AppLocalizations.of(
                            context,
                          )!.translate(LangKeys.reviewTitle),
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1D1D1D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          AppLocalizations.of(
                            context,
                          )!.translate(LangKeys.reviewDesc),
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF1D1D1D),
                          ),
                        ),

                        SizedBox(height: 4),

                        Row(
                          children: [

                            RatingBarIndicator(
                              rating: _userRating,
                              itemBuilder: (context, index) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 25.0,
                              unratedColor: Color(0xFFF0F0F0),
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "4.07",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 3),

                          ],
                        ),

                        SizedBox(height: 4),


                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(height: 1, color: Color(0xFFeeeeee)),
            ),

            SizedBox(height: 14),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start, // Align to top
                children: [
                  ClipOval(
                    child: Obx( () =>
                      Image.asset(
                        reviewerProfileController.img.value,
                        width: 34, // Match CircleAvatar's size
                        height: 34, // Match CircleAvatar's size
                        fit: BoxFit.cover, // Adjust fit to avoid distortion
                      ),
                    ),
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

                        Obx( () =>
                          Text(
                            reviewerProfileController.userName.value,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1D1D1D),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        Row(
                          children: [

                            RatingBarIndicator(
                              rating: _userRating,
                              itemBuilder: (context, index) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 19.0,
                              unratedColor: Color(0xFFF0F0F0),
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "2022.12.09",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF868686),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 3),

                          ],
                        ),

                        SizedBox(height: 4),


                      ],
                    ),
                  ),
                  Image.asset(
                    ImageAssets.bookMark,
                    width: 14, // Match CircleAvatar's size
                    height: 22, // Match CircleAvatar's size
                    fit: BoxFit.cover, // Adjust fit to avoid distortion
                  ),
                ],
              ),
            ),

            SizedBox(height: 18),

            SizedBox(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: index == (catList.length - 1) ? 16 : 0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '“${catList[index].userName}”',
                          style: TextStyle(color: Color(0xFFA0A0A0), fontSize: 10, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 18),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                      ImageAssets.symbolActive, fit : BoxFit.cover, width: 25, height: 25
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context,)!.translate(LangKeys.catDesc1),
                      style: TextStyle(
                        color: Color(0xFFA0A0A0), fontSize: 14, fontWeight: FontWeight.w400,
                        letterSpacing: -0.7,

                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 18),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Image.asset(
                      ImageAssets.symbolNotActive, fit : BoxFit.cover, width: 25, height: 25
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context,)!.translate(LangKeys.catDesc2),
                      style: TextStyle(color: Color(0xFFA0A0A0), fontSize: 14, fontWeight: FontWeight.w400,
                        letterSpacing: -0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 18),

            Center(
              child: SizedBox(
                height: 75,
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Ensures the row wraps around its children
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8), // Adjust spacing as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.0),
                        child: Image.asset(
                          index == 0 ? ImageAssets.review1 :
                          index == 1 ? ImageAssets.review2 : ImageAssets.review3, // Unique images
                          fit: BoxFit.cover, width: 75, height: 75,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            SizedBox(height: 18),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(height: 1, color: Color(0xFFeeeeee)),
            ),

            SizedBox(height: 18),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(ImageAssets.chat, fit : BoxFit.cover, width: 15, height: 15),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context,)!.translate(LangKeys.leaveComment),
                      style: TextStyle(color: Color(0xFFA0A0A0), fontSize: 14, fontWeight: FontWeight.w400,
                        letterSpacing: -0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 34),


          ],
        ),
      ),
    );
  }
}
