





import 'package:flutter/material.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import '../../app_localizations.dart';
import '../../res/assets/image_assets.dart';

class ReviewProfileUserProductList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Center(
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
    );
  }


}








