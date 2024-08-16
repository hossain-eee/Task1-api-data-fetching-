import 'package:task_1_api_data_fetch/Data/Model/gergorian.dart';
import 'package:task_1_api_data_fetch/Data/Model/hijri.dart';

class Date {
  String? readable;
  String? timestamp;
  Gregorian? gregorian;
  Hijri? hijri;

  Date({this.readable, this.timestamp, this.gregorian, this.hijri});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    gregorian = json['gregorian'] != null
        ? Gregorian.fromJson(json['gregorian'])
        : null;
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['readable'] = readable;
    data['timestamp'] = timestamp;
    if (gregorian != null) {
      data['gregorian'] = gregorian!.toJson();
    }
    if (hijri != null) {
      data['hijri'] = hijri!.toJson();
    }
    return data;
  }
}