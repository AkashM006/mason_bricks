import 'package:{{project_name.snakeCase()}}/src/core/usecase/usecase.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/repository/{{feature_name.snakeCase()}}.repository.dart';

class Watch{{feature_name.pascalCase()}}Usecase
    extends Usecase<Stream<List<{{feature_name.pascalCase()}}Entity>>, void> {
  final {{feature_name.pascalCase()}}Repository _{{feature_name.camelCase()}}Repository;

  const Watch{{feature_name.pascalCase()}}Usecase(this.{{feature_name.camelCase()}}Repository);

  @override
  Stream<List<{{feature_name.pascalCase()}}Entity>> call({void params}) =>
      _{{feature_name.camelCase()}}Repository.watch{{feature_name.pascalCase()}}();
}
