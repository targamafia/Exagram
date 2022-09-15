abstract class LoginResult {}

class LoginSuccess extends LoginResult {
  final String userId;
  final String name;
  final String lastName;
  final String email;
  final String companyCode;
  final String token;

  LoginSuccess(
      {required this.userId,
      required this.name,
      required this.lastName,
      required this.email,
      required this.companyCode,
      required this.token});

  @override
  String toString() {
    return 'LoginSuccess{userId: $userId, name: $name, lastName: $lastName, email: $email, companyCode: $companyCode, token: $token}';
  }
}
