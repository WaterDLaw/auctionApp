import 'package:flutter/gestures.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_item.g.dart';

@JsonSerializable()
class GameItem {
  String title;
  String priceLoose;
  String priceCIB;
  String priceNew;

  GameItem(this.title, this.priceLoose, this.priceCIB, this.priceNew);

  factory GameItem.fromJson(Map<String, dynamic> json) =>
      _$GameItemFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemToJson(this);
}
