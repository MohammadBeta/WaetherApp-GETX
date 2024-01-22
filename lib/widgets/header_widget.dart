import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_getx/constants/app_colors.dart';
import 'package:weather_app_getx/controller/global_controller.dart';
import 'package:geocoding/geocoding.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    getAddress(controller.getLatitude().value, controller.getLongitude().value);
    super.initState();
  }

  String city = "";
  final GlobalController controller = Get.put(GlobalController());

  getAddress(double lat, double lon) async {
    List<Placemark> placemarkList = await placemarkFromCoordinates(lat, lon);
    if (placemarkList.isNotEmpty) {
      Placemark placemark = placemarkList[0];
      setState(() {
        city = placemark.locality!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            city,
            style: TextStyle(fontSize: 30, color: AppColor.headerColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            DateFormat("yMMMMd").format(DateTime.now()).toString(),
            style: TextStyle(fontSize: 15, color: AppColor.headerDateColor),
          )
        ],
      ),
    );
  }
}
