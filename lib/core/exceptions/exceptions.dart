import 'dart:io';

class LoginException implements Exception {
  final dynamic message;

  LoginException(this.message);
}
