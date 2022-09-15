import 'package:exagram/core/user/data/datasource/user_remote_datasource.dart';
import 'package:exagram/core/user/data/repository/user_session_repository.dart';
import 'package:exagram/core/user/domain/repository/user_session_repository_impl.dart';

import '../../data/dto/sign_up_result.dart';

class SignUpUseCase {
  UserSessionRepository userSessionRepository =
      UserSessionRepositoryImpl(UserRemoteApiDataSource());

  Future<SignUpResult> call(name, lastName, email, password) {
    return userSessionRepository.singUp(name, lastName, email, password);
  }
}
