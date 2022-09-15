import 'dart:convert';

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
          userId: responseBody["entity"]["user"]["_id"],
          token: responseBody["entity"]["token"],
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
            userId: responseBody['entity']['user']['_id'],
            name: responseBody['entity']['user']['name'],
            lastName: responseBody['entity']['user']['lastName'],
            email: responseBody['entity']['user']['email'],
            companyCode: responseBody['entity']['user']['companyCode'],
            token: responseBody['entity']['token']));
      } else {
        return Result.failure(LoginException(responseBody['error']));
      }
    });
  }
}
