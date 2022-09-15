import 'package:exagram/core/authentication/get_auth_token_usecase.dart';
import 'package:exagram/core/constants.dart';
import 'package:http/http.dart' as http;

class TokenSingleton {
  static final TokenSingleton _singleton = TokenSingleton._internal();
  final GetAuthTokenUseCase _getAuthTokenUseCase = GetAuthTokenUseCase();

  String _token = "";

  Future<String> get() async {
    if (_token.isEmpty) {
      var futureToken = await _getAuthTokenUseCase.call();
      if (futureToken.getOrNull() != null) {
        _token += futureToken.getOrNull();
      } else {
        _token = '';
      }
    }
    return _token;
  }

  factory TokenSingleton() {
    return _singleton;
  }

  TokenSingleton._internal();
}

class API {
  static Future<http.Response> post(String path, {Object? body}) async {
    var token = await TokenSingleton().get();
    return http.post(Uri.https(baseUrl, path),
        headers: {'Authorization': "Bearer $token"}, body: body);
  }

  static Future<http.Response> get(String path) async {
    assert(path.startsWith("/"));
    var token = await TokenSingleton().get();
    var response = await http.get(Uri.https(baseUrl, '/api/v1$path'),
        headers: {'Authorization': "Bearer $token"});
    return response;
  }
}
