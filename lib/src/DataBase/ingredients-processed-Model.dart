class IngredientsProcessedModel {
  final String _createQuery_Processed = '''
CREATE TABLE processed(
    id TEXT PRIMARY KEY,
    ingredient TEXT NOT NULL,
    maker TEXT NOT NULL,
    category TEXT NOT NULL,
    detail_category TEXT NOT NULL,
    unit_quantity TEXT NOT NULL,
    unit TEXT NOT NULL,
    all_quantity_g TEXT NOT NULL,
    all_quantity_ml TEXT NOT NULL,
    calories TEXT NOT NULL,
    moisture TEXT NOT NULL,
    protein TEXT NOT NULL,
    fat TEXT NOT NULL,
    carbonhydrate TEXT NOT NULL,
    sugar TEXT NOT NULL,
    salt TEXT NOT NULL,
    colesterol TEXT NOT NULL,
    fatty_acid TEXT NOT NULL,
    trans_fatty_acid TEXT NOT NULL,
    unsaturated_fatty_acid REAL NOT NULL,
    source TEXT NOT NULL,
    issuer TEXT NOT NULL
)
''';

  late final String id;
  late final String ingredient;
  late final String maker;
  late final String category;
  late final String detail_category;
  late final String unit_quantity;
  late final String unit;
  late final String all_quantity_g;
  late final String all_quantity_ml;
  late final String calories;
  late final String moisture;
  late final String protein;
  late final String fat;
  late final String carbonhydrate;
  late final String sugar;
  late final String salt;
  late final String colesterol;
  late final String fatty_acid;
  late final String trans_fatty_acid;
  late final String unsaturated_fatty_acid;
  late final String source;
  late final String issuer;

  IngredientsProcessedModel({required List<dynamic> csvData}) {
    id = csvData[0].toString();
    ingredient = csvData[1].toString();
    maker = csvData[2].toString();
    category = csvData[3].toString();
    detail_category = csvData[4].toString();
    unit_quantity = csvData[5].toString();
    unit = csvData[6].toString();
    all_quantity_g = csvData[7].toString();
    all_quantity_ml = csvData[8].toString();
    calories = csvData[9].toString();
    moisture = csvData[10].toString();
    protein = csvData[11].toString();
    fat = csvData[12].toString();
    carbonhydrate = csvData[13].toString();
    sugar = csvData[14].toString();
    salt = csvData[15].toString();
    colesterol = csvData[16].toString();
    fatty_acid = csvData[17].toString();
    trans_fatty_acid = csvData[18].toString();
    unsaturated_fatty_acid = csvData[19].toString();
    source = csvData[20].toString();
    issuer = csvData[21].toString();
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "ingredient": ingredient,
      "maker": maker,
      "category": category,
      "detail_category": detail_category,
      "unit_quantity": unit_quantity,
      "unit": unit,
      "all_quantity_g": all_quantity_g,
      "all_quantity_ml": all_quantity_ml,
      "calories": calories,
      "moisture": moisture,
      "protein": protein,
      "fat": fat,
      "carbonhydrate": carbonhydrate,
      "sugar": sugar,
      "salt": salt,
      "colesterol": colesterol,
      "fatty_acid": fatty_acid,
      "trans_fatty_acid": trans_fatty_acid,
      "unsaturated_fatty_acid": unsaturated_fatty_acid,
      "source": source,
      "issuer": issuer,
    };
  }
}
