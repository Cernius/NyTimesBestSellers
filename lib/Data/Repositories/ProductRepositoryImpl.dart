import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:products/Data/Mappers/ProductMapper.dart';
import 'package:products/Data/Models/ProductDTO.dart';
import 'package:products/Data/ServerApi.dart';
import 'package:products/Domain/Models/Cache.dart';
import 'package:products/Domain/Models/Product.dart';
import 'package:products/Domain/Repositories/ProductRepository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ServerApi _serverApi;
  final ProductMapper _productMapper;
  final pagesInProgress = Set<int>();
  final pagesCompleted = Set<int>();
  final completers = HashMap<int, Set<Completer>>();
  final Cache<Product> cache;

  int totalProducts;

  ProductRepositoryImpl(this._serverApi, this._productMapper, this.cache);

  /// if fullCache is true, then Cache will be saved to file for 1 day
  /// if it's false it will be saved only for this session
  @override
  Future<List<Product>> getProducts(int offset, bool fullCache) async {
    if (!fullCache) {
      if (pagesCompleted.contains(offset)) {
        List<Product> products;
        for (int i = 0; i < offset; i++) {
          products.add(await cache.get(offset));
        }
        return products;
      } else if (!pagesInProgress.contains(offset)) {
        List<ProductDTO> productsDTO = await _serverApi
            .getProducts('best-sellers/history.json?offset=$offset&');

        pagesInProgress.add(offset);
        totalProducts = await getNumResults();
        pagesInProgress.remove(offset);
        pagesCompleted.add(offset);

        for (int i = 0; i < productsDTO.length; i++) {
          Product product = _productMapper.map(productsDTO[i]);

          cache.put(offset, product);
          Set<Completer> comps = completers[offset];

          if (comps != null) {
            for (var completer in comps) {
              completer.complete(product);
            }
            comps.clear();
          }
        }

        return productsDTO.map((e) => _productMapper.map(e)).toList();
      }
    } else {
      List<ProductDTO> productsDTO = await _serverApi
          .getProductsCache('best-sellers/history.json?offset=$offset&');

      return productsDTO.map((e) => _productMapper.map(e)).toList();
    }
  }

  @override
  Future<int> getNumResults() async {
    int numResults =
        await _serverApi.getNumResults('best-sellers/history.json?');

    return numResults;
  }
}
