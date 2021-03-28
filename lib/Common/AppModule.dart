import 'dart:developer';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:products/Data/Mappers/ProductMapper.dart';
import 'package:products/Data/Mappers/ReviewMapper.dart';
import 'package:products/Data/Mappers/RankMapper.dart';
import 'package:products/Data/Providers/LoggerImpl.dart';
import 'package:products/Data/Repositories/PreferenceRepositoryImpl.dart';
import 'package:products/Data/Repositories/ProductRepositoryImpl.dart';
import 'package:products/Domain/Models/Cache.dart';
import 'package:products/Data/Repositories/CacheImpl.dart';
import 'package:products/Domain/Repositories/PreferenceRepository.dart';
import 'package:products/Domain/Repositories/ProductRepository.dart';
import 'package:products/Presentation/Common/Localizations/Strings.dart';
import 'package:products/Presentation/Common/Localizations/StringsEn.dart';
import 'package:products/Presentation/Products/ProductsBloc/ProductsBloc.dart';
import '../Data/ServerApi.dart';
import '../Domain/Providers/Logger.dart';

class AppModule {
  Injector initialise(Injector injector) {
    log("Initializing dependency injection module");

    injector.map<Logger>((i) => LoggerImpl(), isSingleton: true);
    injector.map<ServerApi>((i) => ServerApi(), isSingleton: true);
    injector.map<PreferenceRepository>((i) => PreferenceRepositoryImpl(),
        isSingleton: true);
    injector.map<Strings>((i) => StringsEn());
    injector.map<ProductsBloc>((i) => ProductsBloc(
        i.get<ProductRepository>(), i.get<PreferenceRepository>()));

    injector.map<RankMapper>((i) => RankMapper());
    injector.map<ReviewMapper>((i) => ReviewMapper());
    injector.map<ProductRepository>((i) => ProductRepositoryImpl(
        i.get<ServerApi>(), i.get<ProductMapper>(), i.get<Cache>()));

    injector.map<Cache>((i) => MemCache());
    injector.map<ProductMapper>(
        (i) => ProductMapper(i.get<RankMapper>(), i.get<ReviewMapper>()));

    return injector;
  }
}

Injector injector = AppModule().initialise(Injector("default"));
