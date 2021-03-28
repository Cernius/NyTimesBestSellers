abstract class Cache<Product> {
  Future<Product> get(int offset);

  put(int offset, Product object);
}
