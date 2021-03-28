import 'package:products/Domain/Models/Product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts(int offset, bool fullCache);

  Future<int> getNumResults();
}
