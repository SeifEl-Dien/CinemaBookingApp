// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModel {
  final String title;
  final String description;
  final List<String> actors;
  final int like;
  final String posterUrl;
  final String bannerUrl;
  final List<String> screens;
  MovieModel({
    required this.title,
    required this.description,
    required this.actors,
    required this.like,
    required this.posterUrl,
    required this.bannerUrl,
    this.screens = const ['3D', '2D'],
  });

  MovieModel copyWith({
    String? title,
    String? description,
    List<String>? actors,
    int? like,
    String? posterUrl,
    String? bannerUrl,
    List<String>? screens,
  }) {
    return MovieModel(
      title: title ?? this.title,
      description: description ?? this.description,
      actors: actors ?? this.actors,
      like: like ?? this.like,
      posterUrl: posterUrl ?? this.posterUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      screens: screens ?? this.screens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'actors': actors,
      'like': like,
      'posterUrl': posterUrl,
      'bannerUrl': bannerUrl,
      'screens': screens,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'] as String,
      description: map['description'] as String,
      actors: List<String>.from(map['actors'] as List<String>),
      like: map['like'] as int,
      posterUrl: map['posterUrl'] as String,
      bannerUrl: map['bannerUrl'] as String,
      screens: List<String>.from(map['screens'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(title: $title, description: $description, actors: $actors, like: $like, posterUrl: $posterUrl, bannerUrl: $bannerUrl, screens: $screens)';
  }

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        listEquals(other.actors, actors) &&
        other.like == like &&
        other.posterUrl == posterUrl &&
        other.bannerUrl == bannerUrl &&
        listEquals(other.screens, screens);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        actors.hashCode ^
        like.hashCode ^
        posterUrl.hashCode ^
        bannerUrl.hashCode ^
        screens.hashCode;
  }
}
