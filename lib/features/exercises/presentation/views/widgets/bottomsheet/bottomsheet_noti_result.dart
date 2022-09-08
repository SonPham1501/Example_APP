import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../buttons/contained_button.dart';

class BottomSheetNotiResult extends StatelessWidget {
  const BottomSheetNotiResult({
    Key? key,
    required this.answer,
    required this.isCorrect,
    required this.onPress
  }) : super(key: key);

  final bool isCorrect;
  final String answer;
  final AsyncCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-3,0),
            blurRadius: 6,
            spreadRadius: 0,
            color: Theme.of(context).shadowColor,
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Gap(15),
          isCorrect ? correct(context) : incorrect(context),
          const Gap(15),
          Text(
            'Answer:',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Gap(5),
          Text(
            answer,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Gap(30),
          _button(),
          const Gap(40),
        ],
      ),
    );
  }

  Widget correct(BuildContext context) {
    return Row(
      children: <Widget>[
        icon(true),
        const Gap(5),
        Expanded(child: text(context, 'Correct', isCorrect: true)),
      ],
    );
  }

  Widget incorrect(BuildContext context) {
    return Row(
      children: <Widget>[
        icon(false),
        const Gap(5),
        text(context, 'Incorrect', isCorrect: false),
      ],
    );
  }

  Widget text(BuildContext context, String title, {required bool isCorrect}) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            color: isCorrect ? Colors.green : Colors.red,
          ),
    );
  }

  Widget icon(bool isCorrect) {
    return CircleAvatar(
      backgroundColor: (isCorrect ? Colors.green : Colors.red).withOpacity(0.3),
      radius: 12,
      child: Icon(
        isCorrect ? Icons.done : Icons.remove,
        size: 20,
        color: isCorrect ? Colors.green : Colors.red,
      ),
    );
  }

  Widget _button() {
    return ContainedButton(
      text: 'Continue',
      size: const Size(double.infinity, 45),
      radius: 30,
      color: isCorrect ? Colors.green : Colors.red,
      press: onPress,
    );
  }
}
