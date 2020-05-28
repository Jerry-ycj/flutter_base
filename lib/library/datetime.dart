class DateUtil {
  static String formatYMDHMS(dynamic dateTime) {
    if (dateTime is int) {
      dateTime = DateTime.fromMillisecondsSinceEpoch(dateTime);
    }
    if (dateTime is DateTime) {
      return "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(
          2, '0')}-${dateTime.day.toString().padLeft(2, '0')} "
          "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute
          .toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(
          2, '0')}";
    } else {
      return "format-error";
    }
  }

  static String formatYMD(dynamic dateTime) {
    if (dateTime is int) {
      dateTime = DateTime.fromMillisecondsSinceEpoch(dateTime);
    }
    if (dateTime is DateTime) {
      return "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(
          2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    }
    else {
      return "format-error";
    }
  }
}
