

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximapp/screens/home_screen.dart';
import '../../view_models/controller/tab_bar_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Default AppBar height
}





