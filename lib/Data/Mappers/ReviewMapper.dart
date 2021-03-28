import 'package:products/Data/Models/ReviewDTO.dart';
import 'package:products/Domain/Mappers/Mapper.dart';
import 'package:products/Domain/Models/Review.dart';

class ReviewMapper extends Mapper<ReviewDTO, Review> {
  @override
  Review map(ReviewDTO input) {
    if (input == null) {
      return null;
    }

    return Review(
      input.bookReviewLink,
      input.firstChapterLink,
      input.sundayReviewLink,
      input.articleChapterLink,
    );
  }
}
