import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/shared/data/data_sources/db/database.dart';
import 'package:{{project_name.snakeCase()}}/src/features/shared/data/repository/base.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/repository/{{feature_name.snakeCase()}}.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/{{feature_name.snakeCase()}}.entity.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/{{feature_name.snakeCase()}}_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{feature_name.snakeCase()}}.repository.g.dart';

class Db{{feature_name.pascalCase()}}Repository extends BaseRepository implements {{feature_name.pascalCase()}}Repository {
  final AppDatabase _db;

  const Db{{feature_name.pascalCase()}}Repository(this._db);

  @override
  Stream<List<{{feature_name.pascalCase()}}Entity>> watch{{feature_name.pascalCase()}}s() => _db.{{feature_name.camelCase()}}Dao.watch{{feature_name.pascalCase()}}s().map(
    ({{feature_name.camelCase()}}s) => {{feature_name.camelCase()}}s.map(({{feature_name.camelCase()}}) => {{feature_name.pascalCase()}}Mapper.toEntity({{feature_name.camelCase()}})).toList(),
  );

  @override
  Stream<{{feature_name.pascalCase()}}Entity> watch{{feature_name.pascalCase()}}(int id) =>
      _db.{{feature_name.camelCase()}}Dao.watch{{feature_name.pascalCase()}}(id).map(({{feature_name.camelCase()}}) => {{feature_name.pascalCase()}}Mapper.toEntity({{feature_name.camelCase()}}));

  @override
  Future<DataState<{{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}(int id) => safeExecute(() async {
    final result = await _db.{{feature_name.camelCase()}}Dao.get{{feature_name.pascalCase()}}(id);

    return {{feature_name.pascalCase()}}Mapper.toEntity(result);
  });

  @override
  Future<DataState<void>> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Entity new{{feature_name.pascalCase()}}) =>
      safeExecute(() => _db.{{feature_name.camelCase()}}Dao.add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Mapper.fromEntity(new{{feature_name.pascalCase()}})));

  @override
  Future<DataState<List<{{feature_name.pascalCase()}}Entity>>> get{{feature_name.pascalCase()}}s() => safeExecute(() async {
    final result = await _db.{{feature_name.camelCase()}}Dao.get{{feature_name.pascalCase()}}s();

    return result.map(({{feature_name.camelCase()}}) => {{feature_name.pascalCase()}}Mapper.toEntity({{feature_name.camelCase()}})).toList();
  });

  @override
  Future<DataState<void>> update{{feature_name.pascalCase()}}(int id, {{feature_name.pascalCase()}}Entity new{{feature_name.pascalCase()}}) => safeExecute(
    () => _db.{{feature_name.camelCase()}}Dao.update{{feature_name.pascalCase()}}(id, {{feature_name.pascalCase()}}Mapper.fromEntity(new{{feature_name.pascalCase()}})),
  );

  @override
  Future<DataState<void>> delete{{feature_name.pascalCase()}}(int id) =>
      safeExecute(() => _db.{{feature_name.camelCase()}}Dao.delete{{feature_name.pascalCase()}}(id));
}

@riverpod
Db{{feature_name.pascalCase()}}Repository db{{feature_name.pascalCase()}}Repository(Ref ref) {
  final db = ref.watch(dbProvider);

  return Db{{feature_name.pascalCase()}}Repository(db);
}
