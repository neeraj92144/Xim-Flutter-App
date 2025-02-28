import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/components/home/home_app_bar.dart';
import 'package:ximapp/components/home/home_product_list.dart';
import 'package:ximapp/components/home/image_slider.dart';
import 'package:ximapp/model/ProductModel.dart';
import 'package:ximapp/model/UserModel.dart';
import 'package:ximapp/res/assets/image_assets.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';
import 'package:ximapp/res/routes/routes_name.dart';

import '../components/home/home_footer.dart';
import '../components/home/home_search_bar.dart';
import '../components/home/home_user_list.dart';
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
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        // physics : NeverScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Column(
                children: [
                  HomeSearchBar(),
                  ImageSlider(homeController),
                  HomeProductList(homeController)
                ],
              ),
              Container(height: 14, color: Color(0xFFeeeeee)),
              HomeUserList(homeController),
              HomeFooter()
            ],
          ),
        ),
      ),
    );
  }
}

