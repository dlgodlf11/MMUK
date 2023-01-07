//SearchBar Widget
//
//Compare this snippet from lib/AddElement/Widget/SearchBar.dart:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmuk/src/AddElement/Controller/AddElementConroller.dart';

class SearchBar extends StatelessWidget {
  AddElementController addElementController = Get.put(AddElementController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextField(
        controller: addElementController.searchController,
        onChanged: (value) {
          addElementController.searchElement();
        },
        decoration: InputDecoration(
          hintText: "검색",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
//
//Compare this snippet from lib/Refrigerator/Widget/ElementDetail.dart: