import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/repository/{{feature_name.snakeCase()}}_impl.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/usecase/watch_{{feature_name.snakeCase()}}.usecase.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/presentation/dto/{{feature_name.snakeCase()}}.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'watch_{{feature_name.snakeCase()}}.provider.g.dart';

@riverpod
Stream<{{feature_name.pascalCase()}}Dto> {{feature_name.camelCase()}}(Ref ref, int id) {
  final {{feature_name.camelCase()}}Repository = ref.watch({{feature_name.camelCase()}}ImplProvider);

  final result = Watch{{feature_name.pascalCase()}}Usecase({{feature_name.camelCase()}}Repository)(params: id);

  return result.map(({{feature_name.camelCase()}}) => {{feature_name.pascalCase()}}Dto.fromEntity({{feature_name.camelCase()}}));
}
