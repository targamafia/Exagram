import 'package:exagram/core/user/data/datasource/user_info_local_datasource.dart';
import 'package:exagram/core/user/data/repository/user_info_repository.dart';
import 'package:exagram/core/user/domain/repository/user_info_repository_impl.dart';

class SaveLocalUserInfoUseCase {
  UserInfoRepository userInfoRepository =
      UserInfoRepositoryImpl(UserInfoSharedPreferences());

  Future<void> call(
      {required userId,
      required firstName,
      required lastName,
      required email,
      required companyCode,
      required token}) {
    return userInfoRepository.saveUserInfo(UserInfo(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        companyCode: companyCode,
        token: token));
  }
}
