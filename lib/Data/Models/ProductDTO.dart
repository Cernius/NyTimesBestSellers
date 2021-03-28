import 'package:products/Data/Models/RankDTO.dart';
import 'package:products/Data/Models/ReviewDTO.dart';

class ProductDTO {
  String contributor;
  String contributorNote;
  String title;
  String author;
  double price;
  String description;
  String ageGroup;
  String publisher;
  List<RankDTO> rankHistoryDTO;
  List<ReviewDTO> reviewsDTO;

  ProductDTO(
      {this.contributor,
      this.contributorNote,
      this.title,
      this.author,
      this.price,
      this.description,
      this.ageGroup,
      this.publisher,
      this.rankHistoryDTO,
      this.reviewsDTO});

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    List<RankDTO> rankHistoryList;
    var list = json['ranks_history'] as List;
    if (list != null)
      rankHistoryList = list.map((i) => RankDTO.fromJson(i)).toList();
    List<ReviewDTO> reviewList;
    var jsonList = json['reviews'] as List;
    if (jsonList != null)
      reviewList = jsonList.map((i) => ReviewDTO.fromJson(i)).toList();

    return ProductDTO(
        title: json['title'],
        description: json['description'],
        contributor: json['contributor'],
        author: json['author'],
        contributorNote: json['contributor_note'],
        price: double.parse(json['price']),
        ageGroup: json['age_group'],
        publisher: json['publisher'],
        rankHistoryDTO: rankHistoryList,
        reviewsDTO: reviewList);
  }
}
