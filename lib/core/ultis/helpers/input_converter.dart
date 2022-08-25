import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../common/error/failure.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInt(str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class InvalidInputFailure extends Failure {}
