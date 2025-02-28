




import 'package:flutter/material.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import '../../app_localizations.dart';
import '../../res/assets/image_assets.dart';

class ReviewProfileFooter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

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
    );
  }


}







