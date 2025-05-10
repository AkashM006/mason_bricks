/// Pass name and value of the field to check if the field value is empty
String? requiredValidator(String name, String? value) {
  if (value == null || value.isEmpty) return '$name is required';

  return null;
}

/// Pass name and value of the field to check if the field value starts with a digit
String? cannotBeginWithDigitValidator(String name, String? value) {
  final isEmpty = requiredValidator(name, value);

  if (isEmpty != null) return isEmpty;

  final regex = RegExp(r'^\d');
  if (regex.hasMatch(value!)) return "$name cannot start with a digit";

  return null;
}

/// Pass name and value of the field to check if the field value is a number
String? mustBeNumber(String name, String? value) {
  final isEmpty = requiredValidator(name, value);

  if (isEmpty != null) return isEmpty;

  final regex = RegExp(r'^\d+$');
  if (!regex.hasMatch(value!)) return "$name must be a valid number";

  return null;
}

/// Pass name and value of the field to check if the field value is a number and greater than zero
String? numberGreaterThanZero(String name, String? value) {
  final isNumber = mustBeNumber(name, value);

  if (isNumber != null) return isNumber;

  final parsedValue = int.parse(value!);

  if (parsedValue <= 0) return "$name cannot be 0";

  return null;
}

/// Pass name and value of the field to check if the field value has anything other than alphabets and space
String? wordMustNotHaveSpecialCharactersValidator(String name, String? value) {
  final isRequired = requiredValidator(name, value);

  if (isRequired != null) return isRequired;

  final regex = RegExp(r'^[a-zA-Z\s]+$');
  final result = regex.hasMatch(value!.trim());

  if (!result) return "$name can have only alphabets and spaces";

  return null;
}
