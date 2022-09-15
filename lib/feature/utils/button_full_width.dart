import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../main.dart';
import '../../styles.dart';
import 'package:http/http.dart' as http;

class ButtonFullWidth extends StatelessWidget {
  const ButtonFullWidth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          gradient: const LinearGradient(colors: [
            AppColorLight.onPrimaryContainer,
            AppColorLight.primary
          ])),
      child: ElevatedButton(
        onPressed: () {
          Get.offAll(const MyHomePage(title: 'MRP Capacitaciones'));
        },
        child: const Text("Iniciar sesión"),
      ),
    );
  }
}
