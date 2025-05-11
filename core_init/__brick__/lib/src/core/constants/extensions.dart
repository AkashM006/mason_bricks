import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getFormattedTimeFromDuration(Duration duration) =>
    '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

final DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');
final DateFormat dateWithDayFormatter = DateFormat('EEEE, MMMM d');
final DateFormat shortDateFormatter = DateFormat('MMM d');

extension ThemeContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension ListEqualityExtension<T> on List<T> {
  bool isEqualTo(List<T> other) {
    if (length != other.length) return false;

    final count1 = <T, int>{};
    final count2 = <T, int>{};

    for (var item in this) {
      count1[item] = (count1[item] ?? 0) + 1;
    }
    for (var item in other) {
      count2[item] = (count2[item] ?? 0) + 1;
    }

    return count1.toString() == count2.toString();
  }
}

extension StringExtension on String {
  String get capitalize =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

extension DurationExtension on Duration {
  String get formattedTime => getFormattedTimeFromDuration(this);
}

extension IntExtension on int {
  String get formattedTime =>
      getFormattedTimeFromDuration(Duration(seconds: this));
}

extension DateTimeExtension on DateTime {
  String get formattedDate => dateFormatter.format(this);
  String get formattedDateWithDay => dateWithDayFormatter.format(this);
  String get shortFormattedDate => shortDateFormatter.format(this);
  bool get isToday => isSameDate(DateTime.now());
  bool get isTomorrow =>
      isSameDate(DateTime.now().add(const Duration(days: 1)));
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension TimeOfDayFormatter on TimeOfDay {
  String get formattedTime {
    final hour = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final minuteStr = minute.toString().padLeft(2, '0');
    final periodStr = period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minuteStr $periodStr";
  }
}
