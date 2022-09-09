
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app/injection.dart';

import 'buttons/contained_button.dart';

class TotalScore extends StatefulWidget {
  const TotalScore({ Key? key, required this.sum, required this.core }) : super(key: key);

  final int sum;
  final int core;

  @override
  State<TotalScore> createState() => _TotalScoreState();
}

class _TotalScoreState extends State<TotalScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _iconBack(),
            Gap(MediaQuery.of(context).size.height * .25),
            Center(
              child: SizedBox(
                width: 130,
                height: 130,
                child: Stack(
                  children: [
                    //Chưa tìm ra công thức tính
                    CycleProgressWidget(
                      completePercent: (widget.sum - widget.core) * 100 / 180,
                      width: 15,
                      completeColor:
                          ((widget.sum - widget.core) * 100 / 180 == 4)
                              ? Colors.red
                              : Colors.white,
                      lineColor:
                          (widget.sum - widget.core * widget.sum / 180 > 3)
                              ? const Color(0xffffffff)
                              : null,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 30),
                          Text(
                            widget.core.toString(),
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(10),
            Center(
              child: Text(
                'You answered ${widget.core}/${widget.sum} of the questions correctly',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Gap(MediaQuery.of(context).size.height * .3),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _iconBack() {
    return GestureDetector(
      onTap: () => appRouter.pop(),
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 12,
        child: Icon(
          Icons.close,
          size: 20,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _button() {
    return ContainedButton(
      text: 'Continue',
      size: const Size(double.infinity, 45),
      radius: 30,
      color: Colors.white,
      textColor: Colors.blue,
      press: () async => appRouter.pop(),
    );
  }
}

// ignore: must_be_immutable
class CycleProgressWidget extends StatelessWidget {
  Color? lineColor;
  Color? completeColor;
  double completePercent;
  double width;

  CycleProgressWidget({Key? key, this.lineColor, this.completeColor,required this.completePercent, this.width = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AspectRatio(
        aspectRatio: 1,
        child: CustomPaint(
          foregroundPainter: CycleProgressWidgetPainter(
            lineColor: lineColor,
            completeColor: completeColor,
            completePercent: completePercent,
            width: width,
          ),
        ),
      ),
    );
  }
}

class CycleProgressWidgetPainter extends CustomPainter {
  Color? lineColor;
  Color? completeColor;
  double completePercent;
  double width;

  CycleProgressWidgetPainter({this.lineColor, this.completeColor,required this.completePercent,required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor ?? const Color(0xff27AE60)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = completeColor ?? const Color(0xff808080)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
