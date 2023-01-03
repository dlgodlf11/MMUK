import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmuk/AddElement/AddElement.dart';
import 'package:mmuk/Refrigerator/Refrigerator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  PersistentTabController controller = PersistentTabController(initialIndex: 1);

  List<Widget> buildScreens() {
    return [
      Refrigerator(),
      AddElement(),
      Container(
        color: Colors.red,
      ),
    ];
  }
}
