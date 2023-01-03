import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefrigeratorController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
