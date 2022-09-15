import 'package:exagram/core/user/data/datasource/user_info_local_datasource.dart';
import 'package:exagram/core/user/data/repository/user_info_repository.dart';
import 'package:exagram/core/user/domain/repository/user_info_repository_impl.dart';

class GetLocalUserInfoUseCase {
  UserInfoRepository userInfoRepository =
      UserInfoRepositoryImpl(UserInfoSharedPreferences());

  Future<UserInfo> call() {
    return userInfoRepository.getUserInfo();
  }
}
