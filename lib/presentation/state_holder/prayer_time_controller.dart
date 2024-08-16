import 'package:get/get.dart';
import 'package:task_1_api_data_fetch/Data/Model/prayer_time_model.dart';
import 'package:task_1_api_data_fetch/Data/model/network_response.dart';
import 'package:task_1_api_data_fetch/Data/service/network_caller.dart';
import 'package:task_1_api_data_fetch/Data/utility/url.dart';

class PrayerTimeController extends GetxController {
  bool _dataInProgress = false;
  PrayerTime _prayerTime = PrayerTime();
  String _errorMessage = '';

  //getter method
  bool get getDataInProgress => _dataInProgress;
  PrayerTime get getPrayerTime => _prayerTime;
  String get errorMessage => _errorMessage;

  //method for get data from WishList
  Future<bool> getApiData() async {
    _dataInProgress = true;
    update();
    //api fetch
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.url);
    _dataInProgress = false;
    if (response.isSuccess) {
      _prayerTime = PrayerTime.fromJson(response.responseJson ?? {});
      update();
      /*  print("title print");
        print(_prayerTime.data?.map((e) => e.product?.title?? 'not found').toString());
        print("print productId");
        print(_wishListModel.data?.map((e) => e.productId).toString()); */
      print('parse successfull');
      return true;
    } else {
      _errorMessage = "Wish list data fetch failed! tray again";
      update();
      return false;
    }
  }
}
