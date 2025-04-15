import 'package:flutter/services.dart';

/// Pass a max value and when typing if the field value exceeds max value then old value is retained
class MaxValueInputFormatter extends TextInputFormatter {
  final int maxValue;

  MaxValueInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int? intValue = int.tryParse(newValue.text);
    if (intValue == null || intValue > maxValue) {
      return oldValue; // Revert to the previous value if invalid or exceeds max
    }
    return newValue; // Accept the new value if valid
  }
}
