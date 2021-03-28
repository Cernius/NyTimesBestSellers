import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class MyCacheManager extends BaseCacheManager {
  static const key = "customCache";
  static MyCacheManager _instance;

  factory MyCacheManager() {
    if (_instance == null) {
      _instance = new MyCacheManager._();
    }
    return _instance;
  }

  MyCacheManager._()
      : super(key,
      maxAgeCacheObject: Duration(days: 1),
      maxNrOfCacheObjects: 200,
      fileFetcher: _myHttpGetter);

  @override
  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return path.join(directory.path, key);
  }

  static Future<FileFetcherResponse> _myHttpGetter(String url,
      {Map<String, String> headers}) async {
    HttpFileFetcherResponse response;
    try {
      var res = await http.get(url, headers: headers);
      res.headers.addAll({'cache-control': 'private, max-age=120'});
      response = HttpFileFetcherResponse(res);
    } on SocketException {
      print('No internet connection');
    }
    return response;
  }
}
