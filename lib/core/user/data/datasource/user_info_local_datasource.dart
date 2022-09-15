import 'package:shared_preferences/shared_preferences.dart';

class UserInfoLocalDataSource {
  Future<void> saveUserInfo(UserInfo userInfo) async {
    throw UnimplementedError();
  }

  Future<UserInfo> getUserInfo() {
    throw UnimplementedError();
  }
}

class UserInfoSharedPreferences implements UserInfoLocalDataSource {
  @override
  Future<void> saveUserInfo(UserInfo userInfo) async {
    print(userInfo.token);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userInfo.userId', userInfo.userId ?? "");
    await prefs.setString('userInfo.firstName', userInfo.firstName ?? "");
    await prefs.setString('userInfo.lastName', userInfo.lastName ?? "");
    await prefs.setString('userInfo.email', userInfo.email ?? "");
    await prefs.setString('userInfo.companyCode', userInfo.companyCode ?? "");
    await prefs.setString('userInfo.token', userInfo.token ?? "");
  }

  @override
  Future<UserInfo> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return UserInfo(
        userId: prefs.getString('userInfo.userId'),
        firstName: prefs.getString('userInfo.firstName'),
        lastName: prefs.getString('userInfo.lastName'),
        email: prefs.getString('userInfo.email'),
        companyCode: prefs.getString('userInfo.companyCode'),
        token: prefs.getString('userInfo.token'));
  }
}

class UserInfo {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? companyCode;
  final String? token;

  UserInfo(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.companyCode,
      required this.token});

  @override
  String toString() {
    return 'UserInfo{userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, companyCode: $companyCode, token: $token}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfo &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;
}
