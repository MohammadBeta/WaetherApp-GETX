import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controller/global_controller.dart';
import 'package:weather_app_getx/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalController controller = Get.put(GlobalController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => controller.checkLoading().isTrue
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: const [Header()],
                  ),
                ))),
    );
  }
}
