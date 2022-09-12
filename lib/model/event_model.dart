// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventModel {
  final String title;
  final String description;
  final String posterUrl;
  final String date;
  EventModel({
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.date,
  });

  EventModel copyWith({
    String? title,
    String? description,
    String? posterUrl,
    String? date,
  }) {
    return EventModel(
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'date': date,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'] as String,
      description: map['description'] as String,
      posterUrl: map['posterUrl'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(title: $title, description: $description, posterUrl: $posterUrl, date: $date)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.posterUrl == posterUrl &&
        other.date == date;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        posterUrl.hashCode ^
        date.hashCode;
  }
}
