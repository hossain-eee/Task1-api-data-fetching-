import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1_api_data_fetch/Application/state_holder_binder.dart';
import 'package:task_1_api_data_fetch/presentation/ui/screen/home_screen.dart';

class PrayerTimeApp extends StatelessWidget {
  const PrayerTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Api Data Fetch',
      debugShowCheckedModeBanner: false,
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
