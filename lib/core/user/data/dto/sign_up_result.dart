class SignUpResult {}

class SignUpSuccess extends SignUpResult {
  String userId;
  String token;

  SignUpSuccess({required this.userId, required this.token});
}

class SignUpError extends SignUpResult {
  final String error;
  final String errorCode;

  SignUpError({required this.error, required this.errorCode});
}
