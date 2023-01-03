//SearchBar Widget
//
//Compare this snippet from lib/AddElement/Widget/SearchBar.dart:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmuk/AddElement/Controller/AddElementConroller.dart';
import 'package:mmuk/AddElement/Widget/AddDialog.dart';

class SearchResultListView extends StatelessWidget {
  AddElementController addElementController = Get.put(AddElementController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: addElementController.searchResult.length,
        itemBuilder: (context, index) {
          List product =
              addElementController.searchResult[index]["식품명"]!.split("_");

          String productName = addElementController.searchResult[index]["식품명"]!
              .replaceAll("_", " ");

          return ListTile(
            leading: CircleAvatar(
              child: Text("A$index"),
            ),
            title: RichText(
                text: TextSpan(children: [
              for (int i = 0; i < productName.length; i++)
                TextSpan(
                    text: "${productName[i]} ",
                    style: TextStyle(
                      letterSpacing: -1.7,
                      fontSize: 17,
                      color: addElementController.searchController.text
                              .contains(productName[i])
                          ? Color(0xffF69320)
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
            ])),
            subtitle:
                Text("${addElementController.searchResult[index]["식품대분류명"]}"),

            // trailing: IconButton(
            //   icon: Icon(Icons.delete),
            //   onPressed: () {
            //     var aa = [];

            //     elementData.forEach((element) {
            //       if (!aa.contains(element["식품대분류명"])) {
            //         aa.add(element["식품대분류명"]);
            //       }
            //     });
            //     print(aa);
            //     print("Asdfasf");
            //   },
            // ),
            onTap: () {
              Get.dialog(AddDialog(addElementController.searchResult[index]))
                  .then((value) {
                FocusManager.instance.primaryFocus?.unfocus();
              });
            },
          );
        }));
  }
}
//
//Compare this snippet from lib/Refrigerator/Widget/ElementDetail.dart: