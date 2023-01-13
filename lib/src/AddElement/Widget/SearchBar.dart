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
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            child: Container(
          child: TextField(
            controller: addElementController.searchController,
            onChanged: (value) {
              addElementController.searchListfromDB(value);
            },
            decoration: InputDecoration(
              hintText: "검색",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        )),
        Positioned(
            right: 20,
            child: Container(
              child: Obx(() => Row(
                    children: [
                      Radio(
                          value: 0,
                          groupValue: addElementController.radioValue.value,
                          onChanged: (value) {
                            addElementController.radioValue.value =
                                value as int;
                            addElementController.searchListfromDB(
                                addElementController.searchController.text);
                          }),
                      Text("가공식품"),
                      Radio(
                          value: 1,
                          groupValue: addElementController.radioValue.value,
                          onChanged: (value) {
                            addElementController.radioValue.value =
                                value as int;
                            addElementController.searchListfromDB(
                                addElementController.searchController.text);
                          }),
                      Text("농축산물"),
                      Radio(
                          value: 2,
                          groupValue: addElementController.radioValue.value,
                          onChanged: (value) {
                            addElementController.radioValue.value =
                                value as int;
                            addElementController.searchListfromDB(
                                addElementController.searchController.text);
                          }),
                      Text("수산물"),
                    ],
                  )),
            ))
      ],
    );
  }
}
//
//Compare this snippet from lib/Refrigerator/Widget/ElementDetail.dart: