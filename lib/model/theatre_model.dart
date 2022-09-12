// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TheatreModel {
  final String id;
  final String name;
  final List<String> facilites;
  final String fullAddress;
  final List<String> timings;
  final List<String> availableScreens;
  TheatreModel({
    required this.id,
    required this.name,
    this.facilites = const [
      'Cancel',
      'Parking',
      'Hotel',
      'Park',
    ],
    this.fullAddress =
        'Book your, seats and tap, on the reward, box to claim it on, the reward box, to claim it',
    this.timings = const [
      '10:00 AM',
      '1:30 PM',
      '6:30 PM',
      '9:30 PM',
      '12:00 AM',
    ],
    this.availableScreens = const [
      '2D',
      '3D',
    ],
  });

  TheatreModel copyWith({
    String? id,
    String? name,
    List<String>? facilites,
    String? fullAddress,
    List<String>? timings,
    List<String>? availableScreens,
  }) {
    return TheatreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      facilites: facilites ?? this.facilites,
      fullAddress: fullAddress ?? this.fullAddress,
      timings: timings ?? this.timings,
      availableScreens: availableScreens ?? this.availableScreens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'facilites': facilites,
      'fullAddress': fullAddress,
      'timings': timings,
      'availableScreens': availableScreens,
    };
  }

  factory TheatreModel.fromMap(Map<String, dynamic> map) {
    return TheatreModel(
      id: map['id'] as String,
      name: map['name'] as String,
      facilites: List<String>.from(map['facilites'] as List<String>),
      fullAddress: map['fullAddress'] as String,
      timings: List<String>.from(map['timings'] as List<String>),
      availableScreens:
          List<String>.from(map['availableScreens'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TheatreModel.fromJson(String source) =>
      TheatreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TheatreModel(id: $id, name: $name, facilites: $facilites, fullAddress: $fullAddress, timings: $timings, availableScreens: $availableScreens)';
  }

  @override
  bool operator ==(covariant TheatreModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.facilites, facilites) &&
        other.fullAddress == fullAddress &&
        listEquals(other.timings, timings) &&
        listEquals(other.availableScreens, availableScreens);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        facilites.hashCode ^
        fullAddress.hashCode ^
        timings.hashCode ^
        availableScreens.hashCode;
  }
}
