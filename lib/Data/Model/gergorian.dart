import 'package:task_1_api_data_fetch/Data/Model/month.dart';
import 'package:task_1_api_data_fetch/Data/Model/weekday.dart';
class Gregorian {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;


  Gregorian(
      {this.date,
      this.format,
      this.day,
      this.weekday,
      this.month,
      this.year,
    });

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['format'] = format;
    data['day'] = day;
    if (weekday != null) {
      data['weekday'] = weekday!.toJson();
    }
    if (month != null) {
      data['month'] = month!.toJson();
    }
    data['year'] = year;

    return data;
  }
}