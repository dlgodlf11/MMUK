import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmuk/Refrigerator/Model/ElementData.dart';

class AddElementController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<Map<String, String>> searchResult = <Map<String, String>>[].obs;

  searchElement() {
    print("object");
    if (searchController.text == "") {
      searchResult.value = [];
      return;
    }
    searchResult.value = elementData.where((element) {
      return element["식품명"]!.contains(searchController.text);
    }).toList();
  }
}
