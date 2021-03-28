import 'package:flutter/material.dart';
import 'package:products/Domain/Models/Product.dart';
import 'package:products/Domain/Models/Rank.dart';
import 'package:products/Domain/Models/Review.dart';
import 'package:products/Presentation/BaseStatelessWidget.dart';

class ProductInfo extends BaseStatelessWidget {
  final Product product;
  final Size screenSize;

  ProductInfo(this.product, this.screenSize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text(product.title),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(getStrings().bookInfo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildproductInfo(),
            SizedBox(
              height: 10,
            ),
            Text(getStrings().rankHistory,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenSize.width * 0.9,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey[400])),
              child: Column(
                children: [
                  for (Widget w in _buildRankHistory()) w,
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(getStrings().reviews,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenSize.width * 0.9,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey[400])),
              child: Column(
                children: [
                  for (Widget w in _buildReviews()) w,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildproductInfo() {
    return Container(
      width: screenSize.width * 0.9,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[400])),
      child: Column(
        children: [
          product.title != null && product.title != ""
              ? Text(getStrings().title,
              style: TextStyle(fontWeight: FontWeight.bold))
              : Container(),
          product.title != null ? Text(product.title, textAlign: TextAlign.center,) : Container(),
          product.author != null && product.author != ""
              ? Text(getStrings().author,
                  style: TextStyle(fontWeight: FontWeight.bold))
              : Container(),
          product.author != null ? Text("By " + product.author) : Container(),
          product.description != null && product.description != ""
              ? Text(getStrings().description,
                  style: TextStyle(fontWeight: FontWeight.bold))
              : Container(),
          product.description != null
              ? Text(product.description, textAlign: TextAlign.center)
              : Container(),
          product.publisher != null && product.publisher != ""
              ? Text(getStrings().publisher,
                  style: TextStyle(fontWeight: FontWeight.bold))
              : Container(),
          product.publisher != null ? Text(product.publisher) : Container(),
          product.price != null
              ? Text(getStrings().price,
                  style: TextStyle(fontWeight: FontWeight.bold))
              : Container(),
          product.price != null ? Text(product.price.toString()) : Container(),
          product.ageGroup != null && product.ageGroup != ""
              ? Text(getStrings().ageGroup,
                  style: TextStyle(fontWeight: FontWeight.bold))
              : Container(),
          product.ageGroup != null ? Text(product.ageGroup) : Container(),
          product.contributorNote != null && product.contributorNote != ""
              ? Text(getStrings().contributorNote,
                  style: TextStyle(fontWeight: FontWeight.bold))
              : Container(),
          product.contributorNote != null && product.contributorNote != ""
              ? Text(product.contributorNote)
              : Container(),
        ],
      ),
    );
  }

  List<Widget> _buildRankHistory() {
    if (product.rankHistory.length > 0)
      return [
        for (Rank rank in product.rankHistory)
          Container(
            width: screenSize.width * 0.9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
            ),
            child: Column(
              children: [
                Text(getStrings().rank,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(rank.rank),
                Text(getStrings().bestSellersDate,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(rank.bestsellersDate),
                Text(getStrings().publishDate,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(rank.publishedDate),
                Text(getStrings().weeksOnList,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(rank.weeksOnList),
                Text(getStrings().displayName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(rank.displayName),
              ],
            ),
          )
      ];
    else
      return [
        Center(child: Container(child: Text(getStrings().noDataFound))),
      ];
  }

  List<Widget> _buildReviews() {
    if (product.reviews.length > 0)
      return [
        for (Review review in product.reviews)
          review.articleChapterLink != "" &&
                  review.firstChapterLink != "" &&
                  review.bookReviewLink != "" &&
                  review.sundayReviewLink != ""
              ? Container(
                  width: screenSize.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]),
                  ),
                  child: Column(
                    children: [
                      review.articleChapterLink != ""
                          ? Text(getStrings().articleChapterLink,
                              style: TextStyle(fontWeight: FontWeight.bold))
                          : Container(),
                      Text(review.articleChapterLink),
                      review.firstChapterLink != ""
                          ? Text(getStrings().firstChapterLink,
                              style: TextStyle(fontWeight: FontWeight.bold))
                          : Container(),
                      Text(review.firstChapterLink),
                      review.bookReviewLink != ""
                          ? Text(getStrings().bookReviewLink,
                              style: TextStyle(fontWeight: FontWeight.bold))
                          : Container(),
                      Text(review.bookReviewLink),
                      review.sundayReviewLink != ""
                          ? Text(getStrings().sundayReviewLink,
                              style: TextStyle(fontWeight: FontWeight.bold))
                          : Container(),
                      Text(review.sundayReviewLink),
                    ],
                  ),
                )
              : Center(child: Container(child: Text(getStrings().noDataFound))),
      ];
    else
      return [
        Center(child: Container(child: Text(getStrings().noDataFound))),
      ];
  }
}
