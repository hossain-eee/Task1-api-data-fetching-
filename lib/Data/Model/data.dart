import 'package:task_1_api_data_fetch/Data/Model/date.dart';
import 'package:task_1_api_data_fetch/Data/Model/timings.dart';

class Data {
  Timings? timings;
  Date? date;
 

  Data({this.timings, this.date,});

  Data.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (timings != null) {
      data['timings'] = timings!.toJson();
    }
    if (date != null) {
      data['date'] = date!.toJson();
    }
  
    return data;
  }
}