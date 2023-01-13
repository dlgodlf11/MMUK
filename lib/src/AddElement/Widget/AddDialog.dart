import 'package:flutter/material.dart';
import 'package:mmuk/src/DataBase/KeyTranslate.dart';

class AddDialog extends StatelessWidget {
  final Map<String, dynamic> ingredient;
  late final keys;
  AddDialog(this.ingredient) {
    keys = ingredient.keys.toList();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.all(20),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                ingredient["ingredient"],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.black,
              ),
              for (int i = 0; i < keys.length; i++)
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        koreanfromkey[keys[i]]! + " : ",
                        style: TextStyle(
                          fontSize: 15,
                          height: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        ingredient[keys[i]].toString(),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text("영양성분표",
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // Text(
              //     "영양성분함량기준량 : ${ingredient["unit_quantity"]} ${ingredient["unit"]}",
              //     style: TextStyle(
              //         fontSize: 15,
              //         fontWeight: FontWeight.normal,
              //         height: 1.3)),
              // // Container(
              // //   child: GridView.count(
              // //     physics: NeverScrollableScrollPhysics(),
              // //     crossAxisCount: 3,
              // //     shrinkWrap: true,
              // //     children: List.generate(keys.length, (index) {
              // //       return Container(
              // //         child: Column(
              // //           children: [
              // //             Text(
              // //               koreanfromkey[keys[index]]!,
              // //               style: TextStyle(
              // //                 fontSize: 10,
              // //                 fontWeight: FontWeight.bold,
              // //               ),
              // //             ),
              // //             ingredient[keys[index]] == "-"
              // //                 ? SizedBox()
              // //                 : Text(
              // //                     "${ingredient[keys[index]]}",
              // //                     style: TextStyle(
              // //                       fontSize: 10,
              // //                       fontWeight: FontWeight.normal,
              // //                     ),
              // //                   ),
              // //           ],
              // //         ),
              // //       );
              // //     }),
              // //   ),
              // // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "닫기",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
//  "식품코드": "R101-008340501-0000",
//     "식품명": "멥쌀_흑진주벼_현미_생것",
//     "데이터구분코드": "R",
//     "데이터구분명": "원재료성 식품",
//     "식품기원코드": "1",
//     "식품기원명": "식물성",
//     "식품대분류코드": "01",
//     "식품대분류명": "곡류",
//     "대표식품코드": "01008",
//     "대표식품명": "멥쌀",
//     "식품중분류코드": "0100834",
//     "식품중분류명": "흑진주벼",
//     "식품소분류코드": "010083405",
//     "식품소분류명": "현미",
//     "식품세분류코드": "01",
//     "식품세분류명": "생것",
//     "영양성분함량기준량": "100g",
//     "에너지(kcal)": "369",
//     "수분(g)": "10.3",
//     "단백질(g)": "7.90",
//     "지방(g)": "2.60",
//     "회분(g)": "1.50",
//     "탄수화물(g)": "77.70",
//     "당류(g)": "",
//     "식이섬유(g)": "7.4",
//     "칼슘(mg)": "23",
//     "철(mg)": "2.50",
//     "인(mg)": "373",
//     "칼륨(mg)": "351",
//     "나트륨(mg)": "2",
//     "비타민 A(μg RAE)": "4",
//     "레티놀(μg)": "0",
//     "베타카로틴(μg)": "51",
//     "티아민(mg)": "1.010",
//     "리보플라빈(mg)": "0.160",
//     "니아신(mg)": "3.300",
//     "비타민 C(mg)": "0.00",
//     "비타민 D(μg)": "",
//     "콜레스테롤(mg)": "",
//     "포화지방산(g)": "",
//     "트랜스지방산(g)": "",
//     "폐기율(%)": "0",
//     "출처코드": "1",
//     "출처명": "농촌진흥청(국가표준식품성분표)",
//     "원산지국코드": "",
//     "수입여부": "N",
//     "데이터생성방법명": "분석",
//     "원산지국명": "해당없음",
//     "원산지역명": "해당없음",
//     "데이터생성방법코드": "1",
//     "데이터생성일자": "2011-12-31",
//     "생산·채취·포획월": "",
//     "데이터기준일자": "2022-06-13",
//     "제공기관코드": "1390802",
//     "제공기관명": "농촌진흥청 국립농업과학원"
