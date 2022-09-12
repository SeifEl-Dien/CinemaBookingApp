// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReviewModel {
  final String userId;
  final String description;
  final DateTime reviewDate;
  ReviewModel({
    required this.userId,
    required this.description,
    required this.reviewDate,
  });

  ReviewModel copyWith({
    String? userId,
    String? description,
    DateTime? reviewDate,
  }) {
    return ReviewModel(
      userId: userId ?? this.userId,
      description: description ?? this.description,
      reviewDate: reviewDate ?? this.reviewDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'description': description,
      'reviewDate': reviewDate.millisecondsSinceEpoch,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      userId: map['userId'] as String,
      description: map['description'] as String,
      reviewDate: DateTime.fromMillisecondsSinceEpoch(map['reviewDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ReviewModel(userId: $userId, description: $description, reviewDate: $reviewDate)';

  @override
  bool operator ==(covariant ReviewModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.description == description &&
        other.reviewDate == reviewDate;
  }

  @override
  int get hashCode =>
      userId.hashCode ^ description.hashCode ^ reviewDate.hashCode;
}
