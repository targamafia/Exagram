import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/button_full_width.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: TextField(
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
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
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: ButtonFullWidth(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text("Or Create Acount"),
            ),
          ],
        ),
      ),
    );
  }
}
