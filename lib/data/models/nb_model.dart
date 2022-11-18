import 'package:json_annotation/json_annotation.dart';

part 'nb_model.g.dart';
// {
// "title": "UAE Dirham",
// "code": "AED",
// "cb_price": "2978.51",
// "nbu_buy_price": "",
// "nbu_cell_price": "",
// "date": "11/18/2022"
// },
@JsonSerializable()
class NbModel {
  @JsonKey(defaultValue: "", name: "title")
  String title;

  @JsonKey(defaultValue: "", name: "code")
  String code;

  @JsonKey(defaultValue: "", name: "cb_price")
  String cbPrice;

  @JsonKey(defaultValue: "", name: "nbu_buy_price")
  String nbuBuyPrice;

  @JsonKey(defaultValue: "", name: "nbu_cell_price")
  String nbuCellPrice;

  @JsonKey(defaultValue: "", name: "date")
  String date;

  NbModel({
    required this.title,
    required this.code,
    required this.date,
    required this.cbPrice,
    required this.nbuBuyPrice,
    required this.nbuCellPrice
  });

  factory NbModel.fromJson(Map<String, dynamic> json) =>
      _$NbModelFromJson(json);

  Map<String, dynamic> toJson() => _$NbModelToJson(this);
}