import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class Xlogger {
  static var _debug = false;
  static void setEnvironment(bool isDev) {
    _debug = isDev;
  }

  /// Log a message at level [Level.verbose].
  static void v(dynamic message) {
    if (_debug) {
      logger.v(message);
    }
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message) {
    if (_debug) {
      logger.d(message);
    }
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message) {
    if (_debug) {
      logger.i(message);
    }
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message) {
    if (_debug) {
      logger.w(message);
    }
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message) {
    if (_debug) {
      logger.e(message);
    }
  }

  /// Log a message at level [Level.wtf].
  static void wtf(dynamic message) {
    if (_debug) {
      logger.wtf(message);
    }
  }
}
