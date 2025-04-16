import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/todo/domain/todo.entity.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  const {{feature_name.pascalCase()}}Repository();

  Stream<List<{{feature_name.pascalCase()}}Entity>> watch{{feature_name.pascalCase()}}s();
  Stream<{{feature_name.pascalCase()}}Entity> watch{{feature_name.pascalCase()}}(int id);
  Future<DataState<List<{{feature_name.pascalCase()}}Entity>>> get{{feature_name.pascalCase()}}s();
  Future<DataState<{{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}(int id);
  Future<DataState<void>> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Entity new{{feature_name.pascalCase()}});
  Future<DataState<void>> update{{feature_name.pascalCase()}}(int id, {{feature_name.pascalCase()}}Entity new{{feature_name.pascalCase()}});
  Future<DataState<void>> delete{{feature_name.pascalCase()}}(int id);
}
