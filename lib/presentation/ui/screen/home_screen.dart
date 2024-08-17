import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1_api_data_fetch/presentation/state_holder/prayer_time_controller.dart';
import 'package:task_1_api_data_fetch/presentation/ui/screen/prayer_time_screen.dart';
import 'package:task_1_api_data_fetch/presentation/ui/widgets/curve_image.dart';
import 'package:task_1_api_data_fetch/presentation/ui/utility/image_asset.dart';
import 'package:task_1_api_data_fetch/presentation/ui/widgets/paryer_name.dart';

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

  List prayerList = [
    [
      Image.asset(ImageAssets.morningMoon),
      "Fajr",
    ],
    [
      Image.asset(ImageAssets.sunRising),
      "Sunrise",
    ],
    [
      Image.asset(ImageAssets.sunImage),
      "Dhuhr",
    ],
    [
      Image.asset(ImageAssets.sunImage),
      "Asr",
    ],
    [
      Image.asset(ImageAssets.sunSet),
      "Sunset",
    ],
    [
      Image.asset(ImageAssets.moonImage),
      "Maghrib",
    ],
    [
      Image.asset(ImageAssets.moonImage),
      "Isha",
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          const Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: CurvedImageBottom(),
              ),
              Positioned(
                left: 40,
                right: 0,
                top: 50,
                child: Text(
                  "PrayerTime",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<PrayerTimeController>(builder: (controller) {
            if (controller.getDataInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.getApiData();
                },
                child: ListView.builder(
                  itemCount: prayerList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Get.to(() => PrayerTimeScreen(
                              salatName: prayerList[index][1],
                            ));
                      },
                      child: PrayerName(
                        prayerList: prayerList[index],
                      ),
                    );
                  },
                ),
              ),
            );
          }),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
