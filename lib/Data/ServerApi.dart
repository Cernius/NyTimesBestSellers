import 'dart:convert';
import 'dart:developer';
import 'package:products/Common/AppModule.dart';
import 'package:products/Common/CacheManager.dart';
import 'package:products/Data/Exceptions/NetworkException.dart';
import 'package:products/Data/Models/ProductDTO.dart';
import 'package:products/Domain/Providers/Logger.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:products/Domain/Repositories/PreferenceRepository.dart';

class ServerApi {
  Logger _logger = injector.get<Logger>();
  PreferenceRepository _preferenceRepository =
      injector.get<PreferenceRepository>();
  String apiUrl = 'https://api.nytimes.com/svc/books/v3/lists/';

  Future getDataWithCache(String url, {bool ignoreCache = false}) async {
    String fullUrl = apiUrl + url + await _preferenceRepository.getToken();
    try {
      if (ignoreCache) {
        MyCacheManager().removeFile(fullUrl);
      }
      var file = await MyCacheManager()
          .getSingleFile(fullUrl, headers: await _getHeaders());

      if (file != null && await file.exists()) {
        var res = await file.readAsString();

        return res;
      }
    } catch (e) {
      print(e);
    }
    return Response("", 404);
  }

  Future<List<ProductDTO>> getProductsCache(String url) {
    return getDataWithCache(url).then((response) {
      var list = json.decode(response);
      return list['results']
          .map<ProductDTO>((model) => ProductDTO.fromJson(model))
          .toList();
    });
  }

  Future<List<ProductDTO>> getProducts(String url) {
    return getData(url).then((response) {
      var list = json.decode(response.body);
      return list['results']
          .map<ProductDTO>((model) => ProductDTO.fromJson(model))
          .toList();
    });
  }

  Future<int> getNumResults(String url) {
    return getDataWithCache(url).then((response) {
      var num = json.decode(response);
      return num['num_results'];
    });
  }

  Future<Response> getData(String url) async {
    String path = apiUrl + url + await _preferenceRepository.getToken();
    _logger.i("getData(path=$path))");

    Response response = await http.get(path, headers: await _getHeaders());
    if (response.statusCode >= 300) {
      log("Failed GET response: ${response.body}");
      throw NetworkException("GET request($path) failed", response.statusCode);
    }
    return response;
  }

  Future<Map<String, String>> _getHeaders() async => {
        'Authorization': 'Bearer ' + await _preferenceRepository.getToken(),
      };
}
