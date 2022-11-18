// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nb_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NbModel _$NbModelFromJson(Map<String, dynamic> json) => NbModel(
      title: json['title'] as String? ?? '',
      code: json['code'] as String? ?? '',
      date: json['date'] as String? ?? '',
      cbPrice: json['cb_price'] as String? ?? '',
      nbuBuyPrice: json['nbu_buy_price'] as String? ?? '',
      nbuCellPrice: json['nbu_cell_price'] as String? ?? '',
    );

Map<String, dynamic> _$NbModelToJson(NbModel instance) => <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'cb_price': instance.cbPrice,
      'nbu_buy_price': instance.nbuBuyPrice,
      'nbu_cell_price': instance.nbuCellPrice,
      'date': instance.date,
    };
