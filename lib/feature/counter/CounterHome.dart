import 'package:exagram/feature/counter/CounterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Obx(() => Text("Clicks: ${controller.count}")),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to other"),
          onPressed: () => Get.to(Other()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  Other({Key? key}) : super(key: key);

  final CounterController c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(
          title: Text("Page b"),
          elevation: 0.0,
        ),
        body: Center(child: Text("${c.count}")));
  }
}
