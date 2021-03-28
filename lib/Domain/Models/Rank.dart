import 'package:flutter/cupertino.dart';

@immutable
class Rank {
  final String rank;
  final String listName;
  final String displayName;
  final String publishedDate;
  final String bestsellersDate;
  final String weeksOnList;
  final String asterisk;
  final String dagger;

  Rank(
    this.rank,
    this.listName,
    this.displayName,
    this.publishedDate,
    this.bestsellersDate,
    this.weeksOnList,
    this.asterisk,
    this.dagger,
  );
}
