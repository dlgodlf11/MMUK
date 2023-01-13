import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mmuk/src/DataBase/DataBaseController.dart';
import 'package:mmuk/src/Refrigerator/Model/ElementData.dart';

class AddElementController extends GetxController {
  RxList searchResult = [].obs;
  TextEditingController searchController = TextEditingController();
  DataBaseController dataBaseController = Get.find();
  RxInt radioValue = 0.obs;
  List searchType = ["processed", "ground", "water"];
  // searchElement() {
  //   print("object");
  //   if (searchController.text == "") {
  //     searchResult.value = [];
  //     return;
  //   }
  //   searchResult.value = elementData.where((element) {
  //     return element["식품명"]!.contains(searchController.text);
  //   }).toList();
  // }

  Future<void> searchListfromDB(String keyword) async {
    searchResult.value = [];
    if (keyword == "") {
      return;
    }

    switch (searchType[radioValue.value]) {
      case "processed":
        var result = await dataBaseController.searchIngredients(
            dataBaseController.db_Processed,
            searchType[radioValue.value],
            keyword);
        searchResult.value = result;
        break;
      case "ground":
        print(keyword);
        var result = await dataBaseController.searchIngredients(
            dataBaseController.db_Ground,
            searchType[radioValue.value],
            keyword);
        searchResult.value = result;
        break;
      case "water":
        var result = await dataBaseController.searchIngredients(
            dataBaseController.db_Water, searchType[radioValue.value], keyword);
        searchResult.value = result;
        break;
      default:
    }
  }

  searchCsv(String id) async {
    late dynamic ingredient;
    switch (searchType[radioValue.value]) {
      case "processed":
        var result = await dataBaseController.searchId(
            dataBaseController.db_Processed, searchType[radioValue.value], id);
        ingredient = result.first;
        break;
      case "ground":
        var result = await dataBaseController.searchId(
            dataBaseController.db_Ground, searchType[radioValue.value], id);
        ingredient = result.first;
        break;
      case "water":
        var result = await dataBaseController.searchId(
            dataBaseController.db_Water, searchType[radioValue.value], id);
        ingredient = result.first;
        break;
      default:
    }
    return ingredient;
  }
}
