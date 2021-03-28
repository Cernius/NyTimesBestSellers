import 'package:products/Data/Mappers/ReviewMapper.dart';
import 'package:products/Data/Mappers/RankMapper.dart';
import 'package:products/Data/Models/ProductDTO.dart';
import 'package:products/Domain/Mappers/Mapper.dart';
import 'package:products/Domain/Models/Product.dart';

class ProductMapper extends Mapper<ProductDTO, Product> {
  final RankMapper _rankMapper;
  final ReviewMapper _reviewMapper;

  ProductMapper(this._rankMapper, this._reviewMapper);

  @override
  Product map(ProductDTO input) {
    return Product(
        input.contributor,
        input.contributorNote,
        input.title,
        input.author,
        input.price,
        input.description,
        input.ageGroup,
        input.publisher,
        input.rankHistoryDTO.map((e) => _rankMapper.map(e)).toList(),
        input.reviewsDTO.map((e) => _reviewMapper.map(e)).toList());
  }
}
