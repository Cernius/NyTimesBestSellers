import 'package:flutter/cupertino.dart';
import 'package:products/Domain/Models/Rank.dart';

import 'Review.dart';

@immutable
class Product {
  final String contributor;
  final String contributorNote;
  final String title;
  final String author;
  final double price;
  final String description;
  final String ageGroup;
  final String publisher;
  final List<Rank> rankHistory;
  final List<Review> reviews;

  Product(
      this.contributor,
      this.contributorNote,
      this.title,
      this.author,
      this.price,
      this.description,
      this.ageGroup,
      this.publisher,
      this.rankHistory,
      this.reviews);

  Product copyWith({
    String contributor,
    String contributorNote,
    String title,
    String author,
    double price,
    String description,
    String ageGroup,
    String publisher,
    List<Rank> rankHistory,
    List<Review> reviews,
  }) {
    return Product(
      contributor ?? this.contributor,
      contributorNote ?? this.contributorNote,
      title ?? this.title,
      author ?? this.author,
      price ?? this.price,
      description ?? this.description,
      ageGroup ?? this.ageGroup,
      publisher ?? this.publisher,
      rankHistory ?? this.rankHistory,
      reviews ?? this.reviews,
    );
  }
}
