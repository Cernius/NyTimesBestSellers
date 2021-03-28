class ReviewDTO {
  String bookReviewLink;
  String firstChapterLink;
  String sundayReviewLink;
  String articleChapterLink;

  ReviewDTO({
    this.bookReviewLink,
    this.firstChapterLink,
    this.sundayReviewLink,
    this.articleChapterLink,
  });

  factory ReviewDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return ReviewDTO(
      bookReviewLink: json['book_review_link'],
      firstChapterLink: json['first_chapter_link'],
      sundayReviewLink: json['sunday_review_link'],
      articleChapterLink: json['article_chapter_link'],
    );
  }
}
