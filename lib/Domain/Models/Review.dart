import 'package:flutter/cupertino.dart';

@immutable
class Review {
  final String bookReviewLink;
  final String firstChapterLink;
  final String sundayReviewLink;
  final String articleChapterLink;

  Review(
    this.bookReviewLink,
    this.firstChapterLink,
    this.sundayReviewLink,
    this.articleChapterLink,
  );
}
