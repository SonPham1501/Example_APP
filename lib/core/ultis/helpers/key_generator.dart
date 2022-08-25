import 'package:uuid/uuid.dart';

class KeyGenerator {
  static String getRandomKey() => Uuid().v1();
}
