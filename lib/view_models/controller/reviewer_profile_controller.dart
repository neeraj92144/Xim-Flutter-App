
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ximapp/app_localizations.dart';
import 'package:ximapp/res/lang_keys/lang_keys.dart';

import '../../model/UserModel.dart';


class ReviewerProfileController extends GetxController {

  RxString userName = "".obs;
  RxString img = "".obs;
  var catList = [].obs;

  setupView(BuildContext context) {
    var params = Get.arguments as Map<String, String>;
    img.value = params["img"] ?? "";
    userName.value = params["userName"] ?? "";
    catList.value = [
      UserModel(img: "", userName: AppLocalizations.of(context,)!.translate(LangKeys.cat1)),
      UserModel(img: "", userName: AppLocalizations.of(context,)!.translate(LangKeys.cat2)),
      UserModel(img: "", userName: AppLocalizations.of(context,)!.translate(LangKeys.cat3)),
      UserModel(img: "", userName: AppLocalizations.of(context,)!.translate(LangKeys.cat4)),
    ];
  }

}