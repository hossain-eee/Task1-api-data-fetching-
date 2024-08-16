import 'package:flutter/material.dart';

class PrayerName extends StatelessWidget {
  const PrayerName({
    super.key,
    required this.prayerList,
  });
  final List prayerList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: prayerList[0],
            title: Text(prayerList[1]),
            trailing: const Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
