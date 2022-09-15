import 'package:http/http.dart';

import '../dto/sign_up_result.dart';
import 'package:http/http.dart' as http;

class UserRemoteDataSource {
  Future<Response> singUp(name, lastName, email, password) {
    throw UnimplementedError();
  }

  Future<Response> login(email, password) {
    throw UnimplementedError();
  }
}

class UserRemoteApiDataSource implements UserRemoteDataSource {
  var urlSignUp =
      Uri.https("dev-mrp-services.herokuapp.com", "api/v1/users/signup");
  var urlLogin =
      Uri.https("dev-mrp-services.herokuapp.com", "api/v1/users/login");

  @override
  Future<Response> singUp(name, lastName, email, password) async {
    return http.post(urlSignUp, body: {
      "name": name,
      "lastName": lastName,
      "email": email,
      "password": password,
      "companyCode": "MRP"
    });
  }

  @override
  Future<Response> login(email, password) {
    return http.post(urlLogin, body: {
      "email": email,
      "password": password,
    });
  }
}
