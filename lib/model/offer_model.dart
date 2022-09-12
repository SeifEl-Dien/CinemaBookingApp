// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cinemabookingapp/utils/mytheme.dart';

class OfferModel {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime expiry;
  final double discount;
  final Color color;
  final List<Color> gradientColor;
  final String icon;
  OfferModel(
      {required this.title,
      required this.description,
      required this.startTime,
      required this.expiry,
      required this.discount,
      this.color = MyTheme.redTextColor,
      required this.gradientColor,
      this.icon = 'gift_red.svg'});

  OfferModel copyWith({
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? expiry,
    double? discount,
    Color? color,
    List<Color>? gradientColor,
    String? icon,
  }) {
    return OfferModel(
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      expiry: expiry ?? this.expiry,
      discount: discount ?? this.discount,
      color: color ?? this.color,
      gradientColor: gradientColor ?? this.gradientColor,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'startTime': startTime.millisecondsSinceEpoch,
      'expiry': expiry.millisecondsSinceEpoch,
      'discount': discount,
      'color': color.value,
      'gradientColor': gradientColor.map((x) => x.value).toList(),
      'icon': icon,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      title: map['title'] as String,
      description: map['description'] as String,
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int),
      expiry: DateTime.fromMillisecondsSinceEpoch(map['expiry'] as int),
      discount: map['discount'] as double,
      color: Color(map['color'] as int),
      gradientColor: List<Color>.from(
        (map['gradientColor'] as List<int>).map<Color>(
          (x) => Color(x),
        ),
      ),
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) =>
      OfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferModel(title: $title, description: $description, startTime: $startTime, expiry: $expiry, discount: $discount, color: $color, gradientColor: $gradientColor, icon: $icon)';
  }

  @override
  bool operator ==(covariant OfferModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.startTime == startTime &&
        other.expiry == expiry &&
        other.discount == discount &&
        other.color == color &&
        listEquals(other.gradientColor, gradientColor) &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        startTime.hashCode ^
        expiry.hashCode ^
        discount.hashCode ^
        color.hashCode ^
        gradientColor.hashCode ^
        icon.hashCode;
  }
}
