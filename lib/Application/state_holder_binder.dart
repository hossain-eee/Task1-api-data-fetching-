import 'package:get/get.dart';
import 'package:task_1_api_data_fetch/presentation/state_holder/prayer_time_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(PrayerTimeController());
   
  }
}
