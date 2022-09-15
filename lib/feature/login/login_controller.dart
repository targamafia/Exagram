import 'package:exagram/core/user/domain/usecase/login_usecase.dart';
import 'package:exagram/core/user/domain/usecase/save_local_user_info_usecase.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../../core/authentication/save_auht_token_usecase.dart';
import '../../core/user/data/dto/login_result.dart';
import '../utils/result.dart';

class LoginController extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  LoginUseCase loginUseCase = LoginUseCase();
  SaveAuthTokenUseCase saveAuthTokenUseCase = SaveAuthTokenUseCase();
  SaveLocalUserInfoUseCase saveLocalUserInfoUseCase =
      SaveLocalUserInfoUseCase();

  Future<Result> login() async {
    var result = await loginUseCase.call(email.value, password.value);
    if (result.getOrNull() is LoginSuccess) {
      LoginSuccess success = result.getOrNull();
      await saveLocalUserInfoUseCase.call(
          userId: success.userId,
          firstName: success.name,
          lastName: success.lastName,
          email: success.email,
          companyCode: success.companyCode,
          token: success.token);
    }
    return result;
  }
}
