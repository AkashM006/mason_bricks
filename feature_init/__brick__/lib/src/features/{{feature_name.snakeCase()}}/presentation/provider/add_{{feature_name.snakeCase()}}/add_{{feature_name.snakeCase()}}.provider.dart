import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/repository/{{feature_name.snakeCase()}}_impl.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/usecase/add_{{feature_name.snakeCase()}}.usecase.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/presentation/dto/{{feature_name.snakeCase()}}.dto.dart';

part 'add_{{feature_name.snakeCase()}}.provider.g.dart';

@riverpod
class Add{{feature_name.pascalCase()}} extends _$Add{{feature_name.pascalCase()}} {
  @override
  DataState<String>? build() => null;

  void go({{feature_name.pascalCase()}}Dto dto) async {
    state = DataLoading();

    final {{feature_name.camelCase()}}Repository = ref.read({{feature_name.camelCase()}}ImplProvider);

    final result = await Add{{feature_name.pascalCase()}}Usecase({{feature_name.camelCase()}}Repository)(
      params: dto.toEntity(),
    );

    state = result.fold(
      onSuccess: (data) => DataSuccess<String>("New {{feature_name.sentenceCase()}} added"),
      onFailure: (error) => DataFailure(error),
    );
  }
}
