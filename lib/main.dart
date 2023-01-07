import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmuk/src/AddElement/Widget/AddDialog.dart';
import 'package:mmuk/src/Home/Home.dart';
import 'package:mmuk/src/Refrigerator/Model/ElementData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MMUK(),
    );
  }
}

class MMUK extends StatelessWidget {
  MMUK() {
    // Get.dialog(AddDialog(elementData[0]));
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AddDialog(elementData[0]);
  }
}
