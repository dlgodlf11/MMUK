import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mmuk/Refrigerator/Controller/RefrigeratorController.dart';
import 'package:mmuk/Refrigerator/Widget/ElementList.dart';

class Refrigerator extends StatelessWidget {
  RefrigeratorController controller = Get.put(RefrigeratorController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        TabBar(
          controller: controller.tabController,
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          indicatorWeight: 3,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
          ),
          tabs: [
            Tab(
              text: "내 냉장고",
            ),
            Tab(
              text: "내 냉동고",
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              ElementList(),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
