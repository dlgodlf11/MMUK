import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mmuk/Refrigerator/Model/ElementData.dart';
import 'package:mmuk/Refrigerator/Widget/ElementDetail.dart';

class ElementList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          Get.snackbar("냉장고", "새로고침 되었습니다.");
        }, // refresh callback
        child: Container(
          color: Colors.white,
          child: Center(
              child: Text(
            "냉장고에 식품이 없습니다.",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          )),
        ) // scroll view
        );
    // return ListView.builder(
    //     itemCount: elementData.length,
    //     itemBuilder: (context, index) {
    //       List product = elementData[index]["식품명"]!.split("_");

    //       String productName = "";
    //       String productType = elementData[index]["식품세분류명"]! == "해당없음"
    //           ? ""
    //           : elementData[index]["식품세분류명"]!;

    //       productName = product[0].contains("류") ? product[1] : product[0];
    //       // for (int i = 0; i < product.length - 2; i++) {
    //       //   if (i == 0) {
    //       //     productName = product[i];
    //       //   } else {
    //       //     productName = productName + " " + product[i];
    //       //   }
    //       // }
    //       return ListTile(
    //         leading: Hero(
    //           tag: "$index",
    //           child: CircleAvatar(
    //             child: Text("A$index"),
    //           ),
    //         ),
    //         title: RichText(
    //             text: TextSpan(children: [
    //           TextSpan(
    //               text: "$productName ",
    //               style: TextStyle(
    //                 fontSize: 17,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.bold,
    //               )),
    //           TextSpan(
    //               text: "$productType",
    //               style: TextStyle(
    //                 fontSize: 15,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.normal,
    //               )),
    //           TextSpan(
    //               text: " 1개",
    //               style: TextStyle(
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.normal,
    //               )),
    //         ])),
    //         subtitle: Row(
    //           children: [
    //             Expanded(
    //               child: LinearProgressIndicator(
    //                 value: 0.5,
    //                 valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    //                 backgroundColor: Colors.grey,
    //               ),
    //             ),
    //             Text("  5일 남음"),
    //             SizedBox(
    //               width: 100,
    //             )
    //           ],
    //         ),
    //         trailing: IconButton(
    //           icon: Icon(Icons.delete),
    //           onPressed: () {
    //             var aa = [];

    //             elementData.forEach((element) {
    //               if (!aa.contains(element["식품대분류명"])) {
    //                 aa.add(element["식품대분류명"]);
    //               }
    //             });
    //             print(aa);
    //             print("Asdfasf");
    //           },
    //         ),
    //         onTap: () {
    //           Get.dialog(
    //             ElementDetail(),
    //           );
    //         },
    //       );
    //     });
  }
}
