import 'dart:io';

import 'package:exagram/feature/utils/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveAuthTokenUseCase {
  Future<Result> call(String token) async {
    final prefs = await SharedPreferences.getInstance();
    bool isSaved = await prefs.setString('userInfo.token', token);
    if (isSaved) {
      return Result.success(token);
    } else {
      return Result.failure(const FileSystemException(
          "Failed while trying to save Token in System preferences"));
    }
  }
}
