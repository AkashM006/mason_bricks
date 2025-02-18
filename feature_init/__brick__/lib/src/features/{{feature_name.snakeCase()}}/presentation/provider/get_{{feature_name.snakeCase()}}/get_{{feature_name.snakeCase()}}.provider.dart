import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/repository/{{feature_name.snakeCase()}}_impl.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/usecase/get_{{feature_name.snakeCase()}}.usecase.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/presentation/dto/{{feature_name.snakeCase()}}.dto.dart';

part 'get_{{feature_Name.snakeCase()}}.provider.g.dart';

@riverpod
Future<{{feature_name.pascalCase()}}Dto> {{feature_name.camelCase()}}(Ref ref, int id) async {
  final {{feature_name.camelCase()}}Repository = ref.watch({{feature_name.camelCase()}}ImplProvider);

  final result = await Get{{feature_name.pascalCase()}}({{feature_name.camelCase()}}Repository)(params: id);

  return result.fold(
    onSuccess: (data) => {{feature_name.pascalCase()}}Dto.fromEntity(data),
    onFailure: (error) => throw error,
  );
}
