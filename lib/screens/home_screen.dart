import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controller/global_controller.dart';

class HomeScreen extends StatelessWidget {
  final GlobalController controller = Get.put(GlobalController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
