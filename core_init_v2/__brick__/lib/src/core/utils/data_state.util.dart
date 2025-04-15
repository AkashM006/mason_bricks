import 'package:{{ project_name.snakeCase() }}/src/core/utils/custom_error.util.dart';

abstract class DataState<T> {}

class DataSuccess<T> extends DataState<T> {
  final T data;
  DataSuccess(this.data);

  @override
  String toString() => data.toString();
}

class DataFailure<T> extends DataState<T> {
  final CustomError error;
  DataFailure(this.error);

  @override
  String toString() => error.toString();
}

class DataLoading<T> extends DataState<T> {}

extension DataStateExtension<T> on DataState<T> {
  bool get isLoading => this is DataLoading;

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(CustomError error) onFailure,
  }) =>
      this is DataSuccess<T>
          ? onSuccess((this as DataSuccess<T>).data)
          : onFailure((this as DataFailure<T>).error);

  void on({
    required void Function(T data) success,
    required void Function(CustomError error) failed,
    void Function()? loading,
  }) {
    if (this is DataSuccess<T>) {
      return success((this as DataSuccess<T>).data);
    } else if (this is DataFailure<T>) {
      return failed((this as DataFailure<T>).error);
    }

    if (loading != null) loading();
  }
}
