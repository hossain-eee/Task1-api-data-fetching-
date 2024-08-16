import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1_api_data_fetch/Data/Model/timings.dart';
import 'package:task_1_api_data_fetch/presentation/state_holder/prayer_time_controller.dart';

class SalatTime extends StatelessWidget {
  const SalatTime({super.key, required this.salatName});
  final String salatName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: GetBuilder<PrayerTimeController>(builder: (controller) {
        if (controller.getDataInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Create a map for prayer times properties
        final prayerTimesMap = {
          'Fajr': (Timings timings) => timings.fajr,
          'Sunrise': (Timings timings) => timings.sunrise,
          'Dhuhr': (Timings timings) => timings.dhuhr,
          'Asr': (Timings timings) => timings.asr,
          'Sunset': (Timings timings) => timings.sunset,
          'Maghrib': (Timings timings) => timings.maghrib,
          'Isha': (Timings timings) => timings.isha,
        };
        //error message (if data is not fetch)
        if (controller.errorMessage.isNotEmpty)
          return Center(
              child: Text(
            controller.errorMessage,
            style: TextStyle(color: Colors.red, fontSize: 20),
          ));
        //data is loading
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: ListView.builder(
            itemCount: controller.getPrayerTime.data!.length,
            itemBuilder: (context, index) {
              var apiData = controller.getPrayerTime.data![index];
              // Get the prayer time function from the map
              var getPrayerTime = prayerTimesMap[salatName];
              // Get the prayer time value
              String? timingValue = getPrayerTime != null
                  ? getPrayerTime(apiData.timings!)
                  : 'Not available';

              return Card(
                color: Colors.black38,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Date
                      Expanded(
                        flex: 11,
                        child: ListTile(
                          title: FittedBox(
                            child: Text(
                              apiData.date?.gregorian?.date ?? 'No Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ),
                          subtitle: FittedBox(
                            child: Text(
                              apiData.date?.hijri?.date ?? 'No Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Day
                      Expanded(
                        flex: 10,
                        child: ListTile(
                          title: Text(
                            "${apiData.date?.gregorian?.weekday?.en ?? 'No Weekday'}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          subtitle: Text(
                            "${apiData.date?.hijri?.weekday?.ar ?? 'No Weekday'}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                      ),
                      // Prayer Time
                      Expanded(
                        flex: 10,
                        child: ListTile(
                          title: Text(
                            salatName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          subtitle: Text(
                            timingValue!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
