import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart';
{{#uses_db}}
import 'package:{{project_name.snakeCase()}}/src/features/shared/data/data_sources/db/database.dart';
{{/uses_db}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{feature_name.snakeCase()}}.service.g.dart';

class {{feature_name.pascalCase()}}Service {
  {{#uses_db}}
  final AppDatabase _appDatabase;
  {{/uses_db}}

  {{#uses_db}}
  const {{feature_name.pascalCase()}}Service(this._appDatabase);
  {{/uses_db}}

  {{#uses_db}}
  Stream<List<{{feature_name.pascalCase()}}Entity>> watch{{feature_name.pascalCase()}}() =>
      _appDatabase.{{feature_name.camelCase()}}Dao.watch{{feature_name.pascalCase()}}().map(
            (models) => models
                .map(
                  (model) => model.toEntity(),
                )
                .toList(),
          );
  {{/uses_db}}
}

@riverpod
{{feature_name.pascalCase()}}Service {{feature_name.camelCase()}}Service (Ref ref) {
  {{#uses_db}}
  final db = ref.watch(dbProvider);

  return {{feature_name.pascalCase()}}Service(db);
  {{/uses_db}}
}