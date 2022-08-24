import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountDownTimer extends StatefulWidget {

  final int timerMaxSeconds;
  final Function(bool value)? finish;
  const CountDownTimer(this.timerMaxSeconds, {Key? key, this.finish}) : super(key: key);

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {

  final interval = const Duration(seconds: 1);

  int timerMaxSeconds = 180;

  int currentSeconds = 0;
  String timeCountText = "";
  late int totalTimeCount = widget.timerMaxSeconds;

  late Timer _timer;
  late int timerMax = widget.timerMaxSeconds;
  bool isDispose = false;
  bool isPlay = true;
  DateTime timeStart = DateTime.now();

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    intCountDown();
  }

  startTimeout([int? milliseconds]) {
    var duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      if(timerMax>0)
        {
          timerMax--;
          currentSeconds = timerMaxSeconds - timerMax;

        }
    });
    setState(() {});
  }

  void intCountDown() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {

      if (isDispose || !isPlay) {
      } else {
        timerMax = totalTimeCount + timeStart.difference(DateTime.now()).inSeconds;
        if (timerMax <= 0) {
          isPlay = false;
          // Get.back();
          timerMax = 0;
          Fluttertoast.showToast(msg: "Hết thời gian làm bài");
          if (widget.finish != null) {
            widget.finish!(true);
            setState(() {});
          }
        }
      }
      setState(() {});
    });
  }
  void resetTime(){
    isPlay =true;
    setState(() {});
  }

  String getTimeInSecond(int second) {
    var duration = Duration(seconds: second);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours == 0) {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String getTimerText(){
    // timeCountText.value = '${((timerMaxSeconds.value - currentSeconds.value) ~/ 60).toString().padLeft(2, '0')}:'
    //     ' ${((timerMaxSeconds.value - currentSeconds.value) % 60).toString().padLeft(2, '0')}';
    // timerMax =timerMaxSeconds;;
    if(timerMax<=0){
      return "00:00";
    }else{
      return getTimeInSecond(timerMax);
    }
  }
  void restartTimer() {
    _timer.cancel();
    startTimeout();
  }

  @override
  void dispose() {
    isDispose = true;
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getTimerText(),
    );
  }
}

class TimerHandler {
  DateTime? _endingTime;

  TimerHandler._privateConstructor();
  TimerHandler();

  static final TimerHandler _instance = TimerHandler();
  static TimerHandler get instance => _instance;

  int get remainingSeconds {
    final DateTime dateTimeNow = DateTime.now();
    Duration remainingTime = _endingTime!.difference(dateTimeNow);
    // Return in seconds
    return remainingTime.inSeconds;
  }

  void setEndingTime(int durationToEnd) {
    final DateTime dateTimeNow = DateTime.now();

    // Ending time is the current time plus the remaining duration.
    _endingTime = dateTimeNow.add(
      Duration(
        seconds: durationToEnd,
      ),
    );
    debugPrint("this._endingTime $this._endingTime");
  }
}
final timerHandler = TimerHandler.instance;
