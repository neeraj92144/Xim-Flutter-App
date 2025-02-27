
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../app_localizations.dart';
import '../../model/ProductModel.dart';
import '../../model/UserModel.dart';
import '../../res/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';

class HomeController extends GetxController {

  final bannerImages = [].obs;
  final productList = <ProductModel>[].obs;
  final userList = <UserModel>[].obs;

  final controller = CarouselSliderController().obs;
  RxInt currentIndex = 0.obs; // Track active index

  setupView(BuildContext context) {
    bannerImages.value = [
      ImageAssets.banner1,
      ImageAssets.banner2,
      ImageAssets.banner3,
      ImageAssets.banner4,
    ];
    productList.value = [
      ProductModel(
        img: ImageAssets.prod1,
        prodTitle: AppLocalizations.of(context)!.translate(LangKeys.lg1Title),
        prodDesc: AppLocalizations.of(context)!.translate(LangKeys.lg1Desc),
        prodDesc2: AppLocalizations.of(context)!.translate(LangKeys.lg1Desc2),
        prodCat1: AppLocalizations.of(context)!.translate(LangKeys.lg1Cat1),
        prodCat2: AppLocalizations.of(context)!.translate(LangKeys.lg1Cat2),
        rating: 4.89,
        noOfRating: 216,
      ),
      ProductModel(
        img: ImageAssets.prod2,
        prodTitle: AppLocalizations.of(context)!.translate(LangKeys.lg2Title),
        prodDesc: AppLocalizations.of(context)!.translate(LangKeys.lg2Desc),
        prodDesc2: AppLocalizations.of(context)!.translate(LangKeys.lg2Desc2),
        prodCat1: AppLocalizations.of(context)!.translate(LangKeys.lg2Cat1),
        prodCat2: AppLocalizations.of(context)!.translate(LangKeys.lg2Cat2),
        rating: 4.36,
        noOfRating: 136,
      ),
      ProductModel(
        img: ImageAssets.prod3,
        prodTitle: AppLocalizations.of(context)!.translate(LangKeys.lg3Title),
        prodDesc: AppLocalizations.of(context)!.translate(LangKeys.lg3Desc),
        prodDesc2: AppLocalizations.of(context)!.translate(LangKeys.lg3Desc2),
        prodCat1: AppLocalizations.of(context)!.translate(LangKeys.lg3Cat1),
        prodCat2: AppLocalizations.of(context)!.translate(LangKeys.lg3Cat2),
        rating: 3.98,
        noOfRating: 98,
      ),
    ];

    userList.value = [
      UserModel(img: ImageAssets.colCat1, userName: "Name01"),
      UserModel(img: ImageAssets.colCat2, userName: "Name02"),
      UserModel(img: ImageAssets.colCat3, userName: "Name03"),
      UserModel(img: ImageAssets.colCat4, userName: "Name04"),
      UserModel(img: ImageAssets.colCat5, userName: "Name05"),
      UserModel(img: ImageAssets.colCat6, userName: "Name06"),
      UserModel(img: ImageAssets.colCat7, userName: "Name07"),
    ];
  }


}