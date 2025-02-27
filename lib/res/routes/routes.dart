

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/main.dart';
import 'package:ximapp/res/routes/routes_name.dart';
import 'package:ximapp/screens/home_screen.dart';
import 'package:ximapp/screens/my_app.dart';
import 'package:ximapp/screens/reviewer_profile_screen.dart';

import '../../screens/tab_bar_screen.dart';

class AppRoutes {

  static Transition transition = Transition.cupertinoDialog;
  static Duration duration = const Duration(milliseconds: 1000);

  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => TabScreen() ,
      transitionDuration: duration,
      transition: transition ,
    ) ,
    GetPage(
      name: RouteName.reviewProfileScreen,
      page: () => ReviewerProfileScreen() ,
      transitionDuration: duration,
      transition: transition ,
    ) ,

  ];

}