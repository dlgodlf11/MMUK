import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mmuk/src/Refrigerator/Model/ElementData.dart';

class AddElementController extends GetxController {
  RxList<String> searchResult = <String>[].obs;
  TextEditingController searchController = TextEditingController();
  List searchType = ["ground", "water"];
  RxInt radioValue = 0.obs;

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

  Future<void> searchCsv(String keyword) async {
    if (keyword == "") {
      searchResult.value = [];
      return;
    } else {
      searchResult.value = [];

      String filePath =
          "assets/ingredients-${searchType[radioValue.value]}.csv";
      // CSV 파일 읽기
      final data = await rootBundle.loadString(filePath);
      const converter = CsvToListConverter();
      final csvData = converter.convert(data);

      final keys = csvData[0];

      // 재료 이름에 keyword가 포함된 경우 결과에 추가
      for (final row in csvData) {
        if (row[0].toString().contains(keyword)) {
          searchResult.add(row[0]);
        }
      }
    }
  }
}
