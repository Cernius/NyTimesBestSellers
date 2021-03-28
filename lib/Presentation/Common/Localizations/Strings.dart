import 'package:flutter/material.dart';

abstract class Strings {

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }
  String get secondScreen;

  String get rankHistory;

  String get reviews;

  String get bookInfo;

  String get rank;

  String get newYorkTimes;

  String get error;

  String get close;

  String get ok;

  String get submit;

  String get books;

  String get notDefined;

  String get originalTitle;

  String get publishDate;

  String get bestSellersDate;

  String get weeksOnList;

  String get bookReviewLink;

  String get firstChapterLink;

  String get sundayReviewLink;

  String get articleChapterLink;

  String get ageGroup;

  String get contributorNote;

  String get displayName;

  String get title;

  String get price;

  String get author;

  String get publisher;

  String get description;

  String get noDataFound;

  String get loading;

  String get networkError;
}
