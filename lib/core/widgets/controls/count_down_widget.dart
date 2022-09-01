import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';

import '../../config/palette.dart';

class CountDownWidget extends StatelessWidget {
  final CountdownController controller;
  final TextStyle? textStyle;
  final Widget? widgetOnTimeEnd;
  final bool allowSecondOnly;
  const CountDownWidget({
    required this.controller,
    this.textStyle,
    this.widgetOnTimeEnd,
    this.allowSecondOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Countdown(
      countdownController: this.controller,
      builder: (_, time) {
        if (time == Duration.zero) {
          return widgetOnTimeEnd ??
              Text(
                'Hết giờ',
                style: TextStyle(
                  color: Palette.fourthColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              );
        }
        return Text(
          _printDuration(time),
          style: textStyle,
        );
      },
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if ((duration.inMinutes == 0) && (this.allowSecondOnly)) {
      return "$twoDigitSeconds";
    }
    if (duration.inHours == 0) {
      return "$twoDigitMinutes:$twoDigitSeconds";
    } else
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
