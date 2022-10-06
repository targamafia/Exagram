class HttpException implements Exception {
  final int statusCode;
  final String message;

  HttpException({required this.statusCode, required this.message});
}
