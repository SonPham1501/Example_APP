import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../config/constants/constants.dart';

class DataConverter {
  static int doubleToInt(double? value) {
    if (value == null) return 0;
    return value.round();
  }

  static String dateToString(DateTime? date, [String pattern = "dd/MM/yyyy"]) {
    if (date == null) return "";
    final DateFormat formatter = DateFormat(pattern, 'vi');
    return formatter.format(date);
  }

  static String getExpirationDate(DateTime? startAt, DateTime? expiredAt) {
    if (expiredAt == null || startAt == null) return "Không có thời hạn";
    final DateFormat formatter1 = DateFormat("dd/MM");
    final DateFormat formatter2 = DateFormat("dd/MM/yyyy");
    return formatter1.format(startAt) + ' - ' + formatter2.format(expiredAt);
  }

// String fullDateToString(DateTime? date, [String pattern = "hh:mm dd/MM/yyyy"]) {
//   if (date == null) return "";
//   final DateFormat formatter = DateFormat(pattern);
//   return formatter.format(date);
// }

  static String toTimeAgo(DateTime? date) {
    if (date == null) return "";
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    return timeago.format(date, locale: "vi");
  }

  static String durationToString(Duration duration, [bool short = false]) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (short) {
      if (duration.inMinutes == 0) {
        return "$twoDigitSeconds giây";
      } else if (duration.inHours == 0) {
        return "$twoDigitMinutes:$twoDigitSeconds" + 's';
      } else
        return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds" +
            's';
    }
    if (duration.inMinutes == 0) {
      return "$twoDigitSeconds giây";
    } else if (duration.inHours == 0) {
      return "$twoDigitMinutes phút $twoDigitSeconds giây";
    } else
      return "${twoDigits(duration.inHours)} giờ $twoDigitMinutes phút $twoDigitSeconds giây";
  }

  static int dayFromDateToNow(DateTime? date) {
    if (date == null || date.isBefore(DateTime.now())) return 0;
    return date.difference(DateTime.now()).inDays;
  }

  static String scoreToString(double score, [int fractionnDigits = 2]) {
    return score.toStringAsFixed(
        score.truncateToDouble() == score ? 0 : fractionnDigits);
  }

  static String balanceToString(double? balance) {
    if (balance == null) return '0';
    if (balance <= 0) return "0";
    return doubleToInt(balance).toString();
  }

  static String subjectToString(int id) {
    try {
      final subject =
          AppStaticData.subjects.where((element) => element.id == id).first;
      return subject.name;
    } catch (_) {
      return "";
    }
  }
}
