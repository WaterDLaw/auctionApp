// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameItem _$GameItemFromJson(Map<String, dynamic> json) => GameItem(
      json['title'] as String,
      json['priceLoose'] as String,
      json['priceCIB'] as String,
      json['priceNew'] as String,
    );

Map<String, dynamic> _$GameItemToJson(GameItem instance) => <String, dynamic>{
      'title': instance.title,
      'priceLoose': instance.priceLoose,
      'priceCIB': instance.priceCIB,
      'priceNew': instance.priceNew,
    };
