{{#uses_db}}
import 'package:drift/drift.dart';
{{/uses_db}}
import 'package:{{project_name.snakeCase()}}/src/features/shared/data/data_sources/db/database.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/{{feature_name.snakeCase()}}.entity.dart';

{{#uses_db}}
class {{feature_name.pascalCase()}}Mapper {
  static {{feature_name.pascalCase()}}Entity toEntity({{feature_name.pascalCase()}}Data model) =>
      {{feature_name.pascalCase()}}Entity(id: model.id, name: model.name);

  static {{feature_name.pascalCase()}}Companion fromEntity({{feature_name.pascalCase()}}Entity entity) =>
      {{feature_name.pascalCase()}}Companion(name: Value(entity.name));
}
{{/uses_db}}