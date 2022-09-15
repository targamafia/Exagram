import 'package:exagram/core/user/data/dto/login_result.dart';
import 'package:exagram/feature/utils/result.dart';

import '../dto/sign_up_result.dart';

class UserSessionRepository {
  Future<SignUpResult> singUp(name, lastName, email, password) {
    throw UnimplementedError();
  }

  Future<Result> login(email, password) {
    throw UnimplementedError();
  }
}
