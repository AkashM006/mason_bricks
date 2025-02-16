import 'package:drift/drift.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/custom_error.util.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/error_msg.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/model/{{feature_name.snakeCase()}}.model.dart';
import 'package:{{project_name.snakeCase()}}/src/features/shared/data/data_sources/db/database.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/data_sources/local/schema/{{feature_name.snakeCase()}}.schema.dart';
{{#gen_create}}
import 'package:{{project_name.snakeCase()}}/src/core/utils/error_handler.util.dart';
{{/gen_create}}

part '{{feature_name.snakeCase()}}.dao.g.dart';

@DriftAccessor(tables: [
    {{feature_name.pascalCase()}},
])
class {{feature_name.pascalCase()}}Dao extends DatabaseAccessor<AppDatabase> with _${{feature_name.pascalCase()}}DaoMixin {
  final AppDatabase db;

  {{feature_name.pascalCase()}}Dao(this.db): super(db);

  Stream<List<{{feature_name.pascalCase()}}Model>> watch{{feature_name.pascalCase()}}() => 
      select({{feature_name.camelCase()}}).watch().map(({{feature_name.camelCase()}}List) {
        return {{feature_name.camelCase()}}List
            .map(({{feature_name.camelCase()}}) => {{feature_name.pascalCase()}}Model.fromDbModel({{feature_name.camelCase()}},),)
            .toList();
      }).handleError((error) {
        final errorMsg = somethingWentWrongMsg("getting your {{feature_name.sentenceCase()}}");
        throw AppError(message: errorMsg);
      });

  {{#gen_create}}
  Future<void> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Model model) => handleError(() async {
    await into({{feature_name.camelCase()}}).insert(model.toCompanion());
  }, "adding your {{feature_name.sentenceCase()}}");
  {{/gen_create}}
}