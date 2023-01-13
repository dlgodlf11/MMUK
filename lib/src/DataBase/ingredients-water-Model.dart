class IngredientsWaterModel {
  final String _createQuery_Water = '''
CREATE TABLE ground(
    id TEXT PRIMARY KEY,
    ingredient TEXT NOT NULL,
    location TEXT NOT NULL,
    catch_month TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_quantity TEXT NOT NULL,
    unit TEXT NOT NULL,
    calories TEXT NOT NULL,
    moisture TEXT NOT NULL,
    protein TEXT NOT NULL,
    fat TEXT NOT NULL,
    carbonhydrate TEXT NOT NULL,
    fiber TEXT NOT NULL,
    calcium TEXT NOT NULL,
    amino_acid TEXT NOT NULL,
    source TEXT NOT NULL,
    issuer TEXT NOT NULL
)
''';
  late final String id;
  late final String ingredient;
  late final String location;
  late final String catch_month;
  late final String category;
  late final String unit_quantity;
  late final String unit;
  late final String calories;
  late final String moisture;
  late final String protein;
  late final String fat;
  late final String carbonhydrate;
  late final String fiber;
  late final String calcium;
  late final String amino_acid;
  late final String source;
  late final String issuer;

  IngredientsWaterModel({required List<dynamic> csvData}) {
    id = csvData[0].toString();
    ingredient = csvData[1].toString();
    location = csvData[2].toString();
    catch_month = csvData[3].toString();
    category = csvData[4].toString();
    unit_quantity = csvData[5].toString();
    unit = csvData[6].toString();
    calories = csvData[7].toString();
    moisture = csvData[8].toString();
    protein = csvData[9].toString();
    fat = csvData[10].toString();
    carbonhydrate = csvData[11].toString();
    fiber = csvData[12].toString();
    calcium = csvData[13].toString();
    amino_acid = csvData[14].toString();
    source = csvData[15].toString();
    issuer = csvData[16].toString();
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "ingredient": ingredient,
      "location": location,
      "catch_month": catch_month,
      "category": category,
      "unit_quantity": unit_quantity,
      "unit": unit,
      "calories": calories,
      "moisture": moisture,
      "protein": protein,
      "fat": fat,
      "carbonhydrate": carbonhydrate,
      "fiber": fiber,
      "calcium": calcium,
      "amino_acid": amino_acid,
      "source": source,
      "issuer": issuer,
    };
  }
}
