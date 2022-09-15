import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/utils/result.dart';

class GetAuthTokenUseCase {
  Future<Result> call() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('userInfo.token');
    if (token == null) {
      return Result.failure(
          AuthTokenNotFound("Token not found in SharedPreferences"));
    } else {
      return Result.success(token);
    }
  }
}

class AuthTokenNotFound implements Exception {
  final dynamic message;

  AuthTokenNotFound(this.message);
}
