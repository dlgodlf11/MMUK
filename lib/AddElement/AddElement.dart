import 'package:flutter/material.dart';
import 'package:mmuk/AddElement/Widget/SearchBar.dart';
import 'package:mmuk/AddElement/Widget/SearchResult.dart';

class AddElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
              children: [
                SearchBar(),
                Expanded(
                  child: SearchResultListView(),
                ),
                Container(
                  height: 10,
                )
              ],
            ),
            floatingActionButton: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AddElementDetail()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Color(0xffF69320),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text("  직접 추가하기",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            )));
  }
}
