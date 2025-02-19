import 'package:{{project_name.snakeCase()}}/src/core/usecase/usecase.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/repository/{{feature_name.snakeCase()}}.repository.dart';

class Update{{feature_name.pascalCase()}}Usecase
    extends Usecase<Future<DataState<void>>, {{feature_name.pascalCase()}}Entity> {
  final {{feature_name.pascalCase()}}Repository _{{feature_name.camelCase()}}Repository;

  const Update{{feature_name.pascalCase()}}Usecase(this._{{feature_name.camelCase()}}Repository);

  @override
  Future<DataState<void>> call({required {{feature_name.pascalCase()}}Entity params}) =>
      _{{feature_name.camelCase()}}Repository.update{{feature_name.pascalCase()}}(params);
}
