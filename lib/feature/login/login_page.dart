import 'package:exagram/core/exceptions/exceptions.dart';
import 'package:exagram/core/user/domain/usecase/get_local_user_info_usecase.dart';
import 'package:exagram/feature/login/login_controller.dart';
import 'package:exagram/feature/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import '../../core/user/data/dto/login_result.dart';
import '../../main.dart';
import '../../styles.dart';
import 'package:flutter/cupertino.dart';

import '../utils/result.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://mrpcapacitacion.mx/wp-content/uploads/2022/01/Logo-web-mrp-capacitacion-tecnologica.png',
              width: 125,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Iniciar sesion",
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              width: 200,
              child: const Text(
                "Experiencia en cursos educativos de alta calidad",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                onChanged: (text) {
                  controller.email(text);
                },
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                onChanged: (text) {
                  controller.password(text);
                },
                autocorrect: false,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              alignment: Alignment.centerRight,
              child: const Text(
                "¿Olvidaste tu contraseña?",
                textAlign: TextAlign.end,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    gradient: const LinearGradient(colors: [
                      AppColorLight.onPrimaryContainer,
                      AppColorLight.primary
                    ])),
                child: ElevatedButton(
                  onPressed: ([bool mounted = true]) async {
                    Result loginStatus = await controller.login();
                    if (loginStatus.getOrNull() is LoginSuccess) {
                      Get.offAll(
                          () => const MyHomePage(title: 'MRP Capacitaciones'));
                    } else if (loginStatus.exceptionOrNull()
                        is LoginException) {
                      // Removes warning for stateless components, check: https://stackoverflow.com/questions/68871880/do-not-use-buildcontexts-across-async-gaps
                      if (!mounted) return;
                      _showLoginErrorDialog(
                          context,
                          (loginStatus.exceptionOrNull() as LoginException)
                              .message);
                    }
                  },
                  child: const Text("Iniciar sesión"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextButton(
                  onPressed: () {
                    Get.to(() => SignUpPage());
                  },
                  child: const Text("O crea una cuenta")),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoginErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: const Text("Error al iniciar sesion"),
                  content: Text(message),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                )
              : const AlertDialog(
                  title: Text("Success"),
                  content: Text("Saved successfully"),
                );
        });
  }
}
