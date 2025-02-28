

import 'package:flutter/material.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import '../../app_localizations.dart';
import '../../res/assets/image_assets.dart';

class HomeFooter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
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
    );
  }


}





