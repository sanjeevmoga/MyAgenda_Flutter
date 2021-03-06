import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:myagenda/utils/functions.dart';

class Date {
  static bool notSameDay(DateTime a, DateTime b) {
    return a.year != b.year || a.month != b.month || a.day != b.day;
  }

  static String dateFromNow(DateTime date, [Locale locale]) {
    if (locale == null) locale = Locale('en');

    DateTime dateTimeToday = DateTime.now();

    int differenceDays = date.difference(dateTimeToday).inDays;

    final lang = locale.languageCode == "fr"
        ? ["Aujourd'hui", "Demain"]
        : ["Today", "Tomorrow"];

    if (differenceDays == 0)
      return lang[0];
    else if (differenceDays == 1) return lang[1];

    final dateFormat = (dateTimeToday.year == date.year)
        ? DateFormat.MMMMEEEEd(locale.languageCode)
        : DateFormat.yMMMMEEEEd(locale.languageCode);

    return capitalize(dateFormat.format(date));
  }

  static String extractTime(DateTime date, [Locale locale]) {
    if (locale == null) locale = Locale('en');

    return DateFormat.Hm(locale.languageCode).format(date);
  }

  static String extractDate(DateTime date, [Locale locale]) {
    if (locale == null) locale = Locale('en');

    return DateFormat.yMMMMd(locale.languageCode).format(date);
  }
}
