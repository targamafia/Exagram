import 'package:exagram/feature/home/controller/home_controller.dart';
import 'package:exagram/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    controller.refreshFreeTierAssessmentList();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Inicio',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: AppColorLight.primary),
            ),
          ),
          Column(
              children: controller.freeTierAssessment
                  .map((it) => Text(it.title))
                  .toList())
        ],
      ),
    );
  }
}
