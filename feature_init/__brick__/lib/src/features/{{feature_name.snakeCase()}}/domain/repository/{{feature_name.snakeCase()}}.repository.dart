import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart';
{{#gen_create}}
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
{{/gen_create}}

abstract class {{feature_name.pascalCase()}}Repository {
  Stream<List<{{feature_name.pascalCase()}}Entity>> watch{{feature_name.pascalCase()}}();
  Future<DataState<void>> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Entity entity);
}