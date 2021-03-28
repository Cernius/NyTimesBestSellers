abstract class PreferenceRepository {
  Future<void> setToken(String token);

  Future<String> getToken();
}
