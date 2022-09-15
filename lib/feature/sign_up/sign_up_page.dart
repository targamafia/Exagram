import 'package:exagram/feature/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/user/data/dto/sign_up_result.dart';
import '../../main.dart';
import '../../styles.dart';
import '../utils/validators.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.topCenter,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Crea\ntu cuenta",
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: validateFullName,
                onChanged: (text) {
                  controller.name(text);
                },
                autocorrect: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre(s)',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: validateFullName,
                onChanged: (text) {
                  controller.lastName(text);
                },
                autocorrect: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellido(s)',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: validateEmailField,
                onChanged: (text) {
                  controller.email(text);
                },
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: validatePassword,
                onChanged: (text) {
                  controller.password(text);
                },
                autocorrect: false,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: validatePasswordConfirmation,
                onChanged: (text) {
                  controller.confirmedPassword(text);
                },
                autocorrect: false,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirma la contraseña',
                  prefixIcon: Icon(Icons.lock),
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
                    ]),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        var result = await controller.signUp();
                        if (result is SignUpSuccess) {
                          Get.offAll(() =>
                              const MyHomePage(title: 'MRP Capacitaciones'));
                        } else if (result is SignUpError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(result.error)));
                        }
                      }
                    },
                    child: const Text("Crear cuenta"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
