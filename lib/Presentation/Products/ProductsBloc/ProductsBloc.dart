import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Domain/Models/Product.dart';
import 'package:products/Domain/Models/ServerConfig.dart';
import 'package:products/Domain/Repositories/PreferenceRepository.dart';
import 'package:products/Domain/Repositories/ProductRepository.dart';
import 'package:products/Presentation/Products/ProductsData.dart';

class ProductsBloc extends Cubit<ProductsData> {
  final ProductRepository _productRepository;
  final PreferenceRepository _preferenceRepository;

  ProductsBloc(this._productRepository, this._preferenceRepository)
      : super(ProductsData([], 0, 1)) {
    setToken();
    getProducts();
    getNumResults();
  }

  Future<void> setToken() async {
    _preferenceRepository.setToken(ServerConfig().token);
  }

  Future<void> getProducts() async {
    List<Product> products =
        await _productRepository.getProducts(state.offset, true);

    List<Product> stateProducts = state.products;
    stateProducts.addAll(products);

    emit(state.copyWith(products: stateProducts, offset: state.offset + 20));
  }

  Future<void> getNumResults() async {
    emit(state.copyWith(numResults: await _productRepository.getNumResults()));
  }
}
