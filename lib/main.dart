import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mmuk/src/AddElement/Widget/AddDialog.dart';
import 'package:mmuk/src/DataBase/DataBaseController.dart';
import 'package:mmuk/src/Home/Home.dart';
import 'package:mmuk/src/Refrigerator/Model/ElementData.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
  DataBaseController dataBaseController = Get.put(DataBaseController());
  MMUK() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
