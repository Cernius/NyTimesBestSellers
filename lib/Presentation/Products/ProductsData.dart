import 'package:products/Domain/Models/Product.dart';

class ProductsData {
  final List<Product> products;
  final int offset;
  final int numResults;

  ProductsData(this.products, this.offset, this.numResults);

  ProductsData copyWith({List<Product> products, int offset, int numResults}) {
    return ProductsData(products ?? this.products, offset ?? this.offset,
        numResults ?? this.numResults);
  }
}
