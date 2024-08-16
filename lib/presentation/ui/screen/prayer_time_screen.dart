import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task_1_api_data_fetch/presentation/ui/utility/image_asset.dart';
import 'package:task_1_api_data_fetch/presentation/ui/widgets/salat_time.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key, required this.salatName});
  final String salatName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              ImageAssets.desertImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration:const BoxDecoration(
                color: Colors.black54,
              ),
            ),
            Positioned(
              top: 20,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            /*    ListView.builder(itemCount:1 ,itemBuilder: (context,index){
              return SalatTime(salatName: salatName,);
            },) */

            Positioned(
              top: 70,
              left: 0,
              right: 0,
              child: SalatTime(
                salatName: salatName,
              ),
            )
          ],
        ),
      ),
    );
  }
}
