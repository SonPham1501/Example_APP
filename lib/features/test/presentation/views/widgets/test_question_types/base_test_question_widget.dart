import 'package:flutter/material.dart';

import '../../../../domain/models/test/test_type/test_type.dart';

abstract class BaseTestQuestionWidget extends StatelessWidget {
  final TestQuestionType question;
  final int questionIndex;
  final ValueChanged<String> onAnswering;
  final List<String> answered;
  const BaseTestQuestionWidget({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.onAnswering,
    required this.answered,
  }) : super(key: key);
}
