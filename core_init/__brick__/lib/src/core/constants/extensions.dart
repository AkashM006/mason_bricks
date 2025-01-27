import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getFormattedTimeFromDuration(Duration duration) =>
    '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

final DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');

extension ThemeContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
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
}
