import 'package:{{project_name.snakeCase()}}/src/core/usecase/usecase.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/repository/{{feature_name.snakeCase()}}.repository.dart';

class Delete{{feature_name.pascalCase()}}Usecase extends Usecase<Future<DataState<void>>, int> {
  final {{feature_name.pascalCase()}}Repository _{{feature_name.camelCase()}}Repository;

  const Delete{{feature_name.pascalCase()}}Usecase(this._{{feature_name.camelCase()}}Repository);

  @override
  Future<DataState<void>> call({required int params}) =>
      _{{feature_name.camelCase()}}Repository.delete{{feature_name.pascalCase()}}(params);
}
