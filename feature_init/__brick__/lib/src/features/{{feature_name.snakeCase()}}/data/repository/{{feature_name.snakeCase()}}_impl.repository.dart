import 'package:{{project_name.snakeCase()}}/src/features/shared/data/repository/base.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/data_sources/service/{{feature_name.snakeCase()}}.service.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/repository/{{feature_name.snakeCase()}}.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
{{#generate_create}}
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
{{/generate_create}}

part '{{feature_name.snakeCase()}}_impl.repository.g.dart';

class {{feature_name.pascalCase()}}Impl extends BaseRepository implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}Service _{{feature_name.camelCase()}}Service;

  const {{feature_name.pascalCase()}}Impl(this._{{feature_name.camelCase()}}Service);

  @override
  Stream<List<{{feature_name.pascalCase()}}Entity>> watch{{feature_name.pascalCase()}}() => _{{feature_name.camelCase()}}Service.watch{{feature_name.pascalCase()}}();

  @override
  Future<DataState<void>> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Entity entity) =>
      safeExecute(() => _{{feature_name.camelCase()}}Service.add{{feature_name.pascalCase()}}(entity));
}

@riverpod
{{feature_name.pascalCase()}}Impl {{feature_name.camelCase()}}Impl(Ref ref) {
  final {{feature_name.camelCase()}}Service = ref.watch({{feature_name.camelCase()}}ServiceProvider);

  return {{feature_name.pascalCase()}}Impl({{feature_name.camelCase()}}Service);
}