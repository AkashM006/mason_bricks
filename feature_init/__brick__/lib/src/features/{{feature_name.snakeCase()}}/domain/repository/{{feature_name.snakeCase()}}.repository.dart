import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Stream<List<{{feature_name.pascalCase()}}Entity>> watch{{feature_name.pascalCase()}}s();
  Future<DataState<void>> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Entity entity);
  Future<DataState<{{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}(int id);
  Future<DataState<void>> update{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Entity entity);
  Future<DataState<void>> delete{{feature_name.pascalCase()}}(int id);
}