import 'package:flutter/material.dart';
import 'package:futinfo/src/core/utils/app_utils.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget({super.key, required this.utcDate});
  final appUltils = AppUtils();
  final DateTime utcDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(appUltils.formatDateTimeHour(utcDate),
              style: const TextStyle(fontSize: 17)),
        ),
        Text(appUltils.formatDateTime(utcDate),
            style: const TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }
}
