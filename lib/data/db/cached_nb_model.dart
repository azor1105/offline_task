class CachedNBFields {
  static const String tableName = "cached_nb";
  static const String id = "_id";
  static const String title = "title";
  static const String code = "code";
  static const String cbPrice = "cb_price";
  static const String date = "date";

}

// {
// "title": "UAE Dirham",
// "code": "AED",
// "cb_price": "2978.51",
// "nbu_buy_price": "",
// "nbu_cell_price": "",
// "date": "11/18/2022"
// },
class CachedCurrencyModel {
  int? id;
  String title;
  String code;
  String cbPrice;
  String date;

  CachedCurrencyModel({
    required this.cbPrice,
    required this.date,
    required this.code,
    required this.title,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      CachedNBFields.id: id,
      CachedNBFields.title: title,
      CachedNBFields.code: code,
      CachedNBFields.date: date,
      CachedNBFields.cbPrice: cbPrice,
    };
  }

  static CachedCurrencyModel fromJson({required Map<String, Object?> json}) {
    return CachedCurrencyModel(
      id: json[CachedNBFields.id] as int? ?? 0,
      title: json[CachedNBFields.title] as String? ?? "",
      code: json[CachedNBFields.code] as String? ?? "",
      date: json[CachedNBFields.date] as String? ?? "",
      cbPrice: json[CachedNBFields.cbPrice] as String? ?? "",
    );
  }
}
