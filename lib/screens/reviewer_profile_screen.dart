
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

import '../components/review_profile/review_profile_body.dart';
import '../components/review_profile/review_profile_footer.dart';
import '../components/review_profile/review_profile_header.dart';
import '../components/review_profile/user_product_list.dart';

class ReviewerProfileScreen extends StatefulWidget {

  // String img;
  // String userName;required this.userName, required this.img

  ReviewerProfileScreen({Key? key, }) : super(key: key);

  @override
  State<ReviewerProfileScreen> createState() => _ReviewerProfileScreenState();
}

class _ReviewerProfileScreenState extends State<ReviewerProfileScreen> {


  final reviewerProfileController = Get.put(ReviewerProfileController());

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    reviewerProfileController.setupView(context);
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

            ReviewProfileHeader(reviewerProfileController),
            ReviewProfileBody(reviewerProfileController),
            ReviewProfileUserProductList(),
            SizedBox(height: 18),
            ReviewProfileFooter()

          ],
        ),
      ),
    );
  }
}
