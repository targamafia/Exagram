import 'package:exagram/core/authentication/save_auht_token_usecase.dart';
import 'package:get/get.dart';

import '../../core/user/data/dto/login_result.dart';
import '../../core/user/data/dto/sign_up_result.dart';
import '../../core/user/domain/usecase/sign_up_usecase.dart';

class SignUpController extends GetxController {
  var name = "".obs;
  var lastName = "".obs;
  var email = "".obs;
  var password = "".obs;
  var confirmedPassword = "".obs;

  Future<SignUpResult> signUp() async {
    return SignUpUseCase()
        .call(name.value, lastName.value, email.value, password.value);
  }
}
