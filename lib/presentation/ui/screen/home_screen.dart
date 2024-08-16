import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1_api_data_fetch/presentation/state_holder/prayer_time_controller.dart';
import 'package:task_1_api_data_fetch/presentation/ui/widgets/curve_image.dart';
import 'package:task_1_api_data_fetch/presentation/ui/utility/image_asset.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<PrayerTimeController>().getApiData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: CurvedImageBottom(),
          ),
        ],
      ),
    );
  }
}
