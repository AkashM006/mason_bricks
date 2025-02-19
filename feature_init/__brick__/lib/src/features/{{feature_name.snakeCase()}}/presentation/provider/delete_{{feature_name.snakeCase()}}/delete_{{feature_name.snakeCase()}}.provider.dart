import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/repository/{{feature_name.snakeCase()}}_impl.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/usecase/delete_{{feature_name.snakeCase()}}.usecase.dart';

part 'delete_{{feature_name.snakeCase()}}.provider.g.dart';

@riverpod
class Delete{{feature_name.pascalCase()}} extends _$Delete{{feature_name.pascalCase()}} {
  @override
  DataState<String>? build() => null;

  void go(int id) async {
    state = DataLoading();

    await Future.delayed(const Duration(seconds: 4));

    final {{feature_name.camelCase()}}Repository = ref.read({{feature_name.camelCase()}}ImplProvider);

    final result = await Delete{{feature_name.pascalCase()}}Usecase({{feature_name.camelCase()}}Repository)(params: id);

    state = result.fold(
      onSuccess: (data) => DataSuccess<String>("Deleted {{feature_name.sentenceCase()}}"),
      onFailure: (error) => DataFailure(error),
    );
  }
}
