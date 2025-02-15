import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Stream<List<{{feature_name.pascalCase()}}Entity>> watch{{feature_name.pascalCase()}}();
}