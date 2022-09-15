import 'package:exagram/core/user/data/datasource/user_info_local_datasource.dart';
import 'package:exagram/core/user/data/repository/user_info_repository.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  UserInfoLocalDataSource userInfoLocalDataSource;

  UserInfoRepositoryImpl(this.userInfoLocalDataSource);

  @override
  Future<UserInfo> getUserInfo() {
    return userInfoLocalDataSource.getUserInfo();
  }

  @override
  Future<void> saveUserInfo(UserInfo userInfo) {
    return userInfoLocalDataSource.saveUserInfo(userInfo);
  }
}
