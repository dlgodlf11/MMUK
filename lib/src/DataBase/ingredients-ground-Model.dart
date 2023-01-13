class IngredientsGroundModel {
  late final String id;
  late final String ingredient;
  late final String category;
  late final String unit_quantity;
  late final String unit;
  late final String calories;
  late final String moisture;
  late final String protein;
  late final String fat;
  late final String carbonhydrate;
  late final String sugar;
  late final String fiber;
  late final String amino_acid;
  late final String colesterol;
  late final String fatty_acid;
  late final String unsaturated_fatty_acid;
  late final String trans_fatty_acid;
  late final String source;
  late final String issuer;

  IngredientsGroundModel({required List<dynamic> csvData}) {
    id = csvData[0].toString();
    ingredient = csvData[1].toString();
    category = csvData[2].toString();
    unit_quantity = csvData[3].toString();
    unit = csvData[4].toString();
    calories = csvData[5].toString();
    moisture = csvData[6].toString();
    protein = csvData[7].toString();
    fat = csvData[8].toString();
    carbonhydrate = csvData[9].toString();
    sugar = csvData[10].toString();
    fiber = csvData[11].toString();
    amino_acid = csvData[12].toString();
    colesterol = csvData[13].toString();
    fatty_acid = csvData[14].toString();
    unsaturated_fatty_acid = csvData[15].toString();
    trans_fatty_acid = csvData[16].toString();
    source = csvData[17].toString();
    issuer = csvData[18].toString();
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "ingredient": ingredient,
      "category": category,
      "unit_quantity": unit_quantity,
      "unit": unit,
      "calories": calories,
      "moisture": moisture,
      "protein": protein,
      "fat": fat,
      "carbonhydrate": carbonhydrate,
      "sugar": sugar,
      "fiber": fiber,
      "amino_acid": amino_acid,
      "colesterol": colesterol,
      "fatty_acid": fatty_acid,
      "unsaturated_fatty_acid": unsaturated_fatty_acid,
      "trans_fatty_acid": trans_fatty_acid,
      "source": source,
      "issuer": issuer,
    };
  }
}
