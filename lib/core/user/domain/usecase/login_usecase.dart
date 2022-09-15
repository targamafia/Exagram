import 'package:exagram/feature/utils/result.dart';

import '../../data/datasource/user_remote_datasource.dart';
import '../../data/dto/login_result.dart';
import '../../data/repository/user_session_repository.dart';
import '../repository/user_session_repository_impl.dart';

class LoginUseCase {
  UserSessionRepository userSessionRepository =
      UserSessionRepositoryImpl(UserRemoteApiDataSource());

  Future<Result> call(email, password) async {
    return userSessionRepository.login(email, password);
  }
}
