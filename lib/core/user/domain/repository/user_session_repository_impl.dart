import 'dart:convert';
import 'dart:io';

import 'package:exagram/core/exceptions/exceptions.dart';
import 'package:exagram/core/user/data/datasource/user_remote_datasource.dart';
import 'package:exagram/core/user/data/dto/login_result.dart';
import 'package:exagram/core/user/data/dto/sign_up_result.dart';
import 'package:exagram/core/user/data/repository/user_session_repository.dart';

import '../../../../feature/utils/result.dart';

class UserSessionRepositoryImpl implements UserSessionRepository {
  final UserRemoteDataSource dataSource;

  UserSessionRepositoryImpl(this.dataSource);

  @override
  Future<SignUpResult> singUp(name, lastName, email, password) {
    return dataSource.singUp(name, lastName, email, password).then((response) {
      var responseBody = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      if (response.statusCode == 201) {
        return SignUpSuccess(
          userId: responseBody["_value"]["user"]["_id"],
          token: responseBody["_value"]["token"],
        );
      } else {
        return SignUpError(
            error: responseBody["error"], errorCode: responseBody["errorCode"]);
      }
    });
  }

  @override
  Future<Result> login(email, password) {
    return dataSource.login(email, password).then((response) {
      var responseBody = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      if (response.statusCode == 200) {
        return Result.success(LoginSuccess(
            userId: responseBody['_value']['user']['_id'],
            name: responseBody['_value']['user']['name'],
            lastName: responseBody['_value']['user']['lastName'],
            email: responseBody['_value']['user']['email'],
            companyCode: responseBody['_value']['user']['companyCode'],
            token: responseBody['_value']['token']));
      } else {
        return Result.failure(LoginException(responseBody['error']));
      }
    });
  }
}
