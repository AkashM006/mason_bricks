import 'package:{{project_name.snakeCase()}}/src/core/utils/custom_error.util.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/error_msg.util.dart';

/// Pass a function throws anything and also pass the action done by the function
Future<T> handleError<T>(
  Future<T> Function() operation,
  String somethingWentWrongMsgAction,
) async {
  try {
    return await operation();
  } catch (e) {
    if (e is AppError) rethrow;
    final errorMsg = somethingWentWrongMsg(somethingWentWrongMsgAction);
    throw AppError(message: errorMsg);
  }
}
