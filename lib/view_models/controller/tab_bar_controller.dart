import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TabScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
    super.onInit();
  }

  void changeTab(int index) {
    selectedIndex.value = index;
    //tabController.animateTo(index);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
