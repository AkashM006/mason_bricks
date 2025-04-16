import 'package:drift/drift.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/custom_error.util.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/error_handler.util.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/error_msg.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/shared/data/data_sources/db/database.dart';
import 'package:{{project_name.snakeCase()}}/src/features/todo/data/data_sources/db/schema/todo.scheme.dart';

part '{{feature_name.snakeCase()}}.dao.g.dart';

@DriftAccessor(
  tables: [
    {{feature_name.pascalCase()}},
  ],
)
class {{feature_name.pascalCase()}}Dao extends DatabaseAccessor<AppDatabase> with _${{feature_name.pascalCase()}}DaoMixin {
  final AppDatabase db;

  {{feature_name.pascalCase()}}Dao(this.db) : super(db);

  Stream<List<{{feature_name.pascalCase()}}Data>> watch{{feature_name.pascalCase()}}s() =>
      select({{feature_name.camelCase()}}).watch().handleError((error) {
        final errorMsg = somethingWentWrongMsg("getting your {{feature_name.sentenceCase()}}s");
        throw AppError(message: errorMsg);
      });

  Future<List<{{feature_name.pascalCase()}}Data>> get{{feature_name.pascalCase()}}s() =>
      handleError(() => select({{feature_name.camelCase()}}).get(), "getting your {{feature_name.sentenceCase()}}s");

  Stream<{{feature_name.pascalCase()}}Data> watch{{feature_name.pascalCase()}}(int id) =>
      (select({{feature_name.camelCase()}})
        ..where((tbl) => tbl.id.equals(id))).watchSingle().handleError((error) {
        final errorMsg = somethingWentWrongMsg("getting your {{feature_name.sentenceCase()}}");
        throw AppError(message: errorMsg);
      });

  Future<{{feature_name.pascalCase()}}Data> get{{feature_name.pascalCase()}}(int id) async => handleError(() async {
    final query = (select({{feature_name.camelCase()}})..where((tbl) => tbl.id.equals(id)));

    final {{feature_name.camelCase()}}Entry = await query.getSingleOrNull();

    if ({{feature_name.camelCase()}}Entry == null) {
      final errorMsg = doesNotExistMsg("{{feature_name.sentenceCase()}} you're trying to get");
      throw AppError(message: errorMsg);
    }

    return {{feature_name.camelCase()}}Entry;
  }, "getting your {{feature_name.sentenceCase()}}");

  Future<void> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Companion new{{feature_name.pascalCase()}}) async => handleError(() async {
    await into({{feature_name.camelCase()}}).insert(new{{feature_name.pascalCase()}});
  }, "adding your {{feature_name.sentenceCase()}}");

  Future<void> update{{feature_name.pascalCase()}}(int id, {{feature_name.pascalCase()}}Companion new{{feature_name.pascalCase()}}) async =>
      handleError(() async {
        final query = (select({{feature_name.camelCase()}})..where((tbl) => tbl.id.equals(id)));

        final result = await query.getSingleOrNull();

        if (result == null) {
          final errorMsg = doesNotExistMsg("{{feature_name.sentenceCase()}} you're trying edit");
          throw AppError(message: errorMsg);
        }

        await (update({{feature_name.camelCase()}})..where((tbl) => tbl.id.equals(id))).write(new{{feature_name.pascalCase()}});
      }, "updating your {{feature_name.pascalCase()}}");

  Future<void> delete{{feature_name.pascalCase()}}(int id) async => handleError(() async {
    final query = (select({{feature_name.camelCase()}})..where((tbl) => tbl.id.equals(id)));

    final result = await query.get();

    if (result.length > 1) {
      final errorMsg = multipleRecordsFound("delete your {{feature_name.sentenceCase()}}");
      throw AppError(message: errorMsg);
    }

    if (result.isEmpty) {
      final errorMsg = doesNotExistMsg("{{feature_name.sentenceCase()}} you're trying to delete");
      throw AppError(message: errorMsg);
    }

    await (delete({{feature_name.camelCase()}})..where((tbl) => tbl.id.equals(id))).go();
  }, "deleting your {{feature_name.sentenceCase()}}");
}
