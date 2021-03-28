import 'package:products/Domain/Repositories/PreferenceRepository.dart';
import 'package:synchronized/synchronized.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepositoryImpl extends PreferenceRepository {
  final Lock _lock = Lock();
  SharedPreferences _prefs;

  Future<SharedPreferences> _getPreferences() async {
    return await _lock.synchronized(() async {
      if (_prefs == null) {
        _prefs = await SharedPreferences.getInstance();
        return _prefs;
      } else {
        return _prefs;
      }
    });
  }

  @override
  Future<void> setToken(String token) async {
    var prefs = await _getPreferences();
    await prefs.setString('token', token);
  }

  @override
  Future<String> getToken() async {
    var prefs = await _getPreferences();
    var token = prefs.getString('token');
    return token;
  }
}
