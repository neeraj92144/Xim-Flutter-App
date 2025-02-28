

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import '../../app_localizations.dart';
import '../../res/assets/image_assets.dart';
import '../../view_models/controller/reviewer_profile_controller.dart';

class ReviewProfileHeader extends StatelessWidget {

  final ReviewerProfileController reviewerProfileController = Get.find<ReviewerProfileController>(); // Fetching GetX controller

  // Constructor to receive the controller
  ReviewProfileHeader(ReviewerProfileController controller, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }


}





