

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import 'package:ximapp/screens/home_screen.dart';
import '../../app_localizations.dart';
import '../../view_models/controller/tab_bar_controller.dart';

class HomeSearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
    );
  }


}





