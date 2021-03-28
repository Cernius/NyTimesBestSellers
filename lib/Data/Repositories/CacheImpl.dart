import 'dart:async';
import 'dart:collection';
import 'package:products/Domain/Models/Product.dart';
import '../../Domain/Models/Cache.dart';

class MemCache<T> extends Cache<Product> {
  final map = HashMap<int, Product>();

  @override
  Future<Product> get(int index) {
    return Future.value(map[index]);
  }

  @override
  put(int index, object) {
    map[index] = object;
  }
}
