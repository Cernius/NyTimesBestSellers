class NetworkException implements Exception {
  String message;
  int code;

  NetworkException(this.message, this.code);

  @override
  String toString() => "$message. Http code: $code";
}
