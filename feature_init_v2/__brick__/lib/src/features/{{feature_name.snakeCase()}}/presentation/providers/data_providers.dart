import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/repository/db/db_{{feature_name.snakeCase()}}.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/{{feature_name.snakeCase()}}.entity.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/presentation/providers/side_effect_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_providers.g.dart';

@riverpod
class {{feature_name.pascalCase()}}s extends _${{feature_name.pascalCase()}}s {
  @override
  void build() {}

  Future<void> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Entity new{{feature_name.pascalCase()}}) async {
    await ref.read(add{{feature_name.pascalCase()}}Provider.notifier).go(new{{feature_name.pascalCase()}});
  }

  Future<void> update{{feature_name.pascalCase()}}(int id, {{feature_name.pascalCase()}}Entity new{{feature_name.pascalCase()}}) async {
    await ref.read(update{{feature_name.pascalCase()}}Provider.notifier).go(id, new{{feature_name.pascalCase()}});
  }

  Future<void> delete{{feature_name.pascalCase()}}(int id) async {
    await ref.read(delete{{feature_name.pascalCase()}}Provider.notifier).go(id);
  }
}

@riverpod
Stream<List<{{feature_name.pascalCase()}}Entity>> watch{{feature_name.pascalCase()}}s(Ref ref) {
  final {{feature_name.camelCase()}}Repositoy = ref.watch(db{{feature_name.pascalCase()}}RepositoryProvider);

  return {{feature_name.camelCase()}}Repositoy.watch{{feature_name.pascalCase()}}s();
}

@riverpod
Future<List<{{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}s(Ref ref) async {
  final {{feature_name.camelCase()}}Repository = ref.watch(db{{feature_name.pascalCase()}}RepositoryProvider);

  final result = await {{feature_name.camelCase()}}Repository.get{{feature_name.pascalCase()}}s();

  return result.fold(
    onSuccess: (data) => data,
    onFailure: (error) => throw error,
  );
}

@riverpod
Stream<{{feature_name.pascalCase()}}Entity> watch{{feature_name.pascalCase()}}(Ref ref, {required int id}) {
  final {{feature_name.camelCase()}}Repository = ref.watch(db{{feature_name.pascalCase()}}RepositoryProvider);

  return {{feature_name.camelCase()}}Repository.watch{{feature_name.pascalCase()}}(id);
}

@riverpod
Future<{{feature_name.pascalCase()}}Entity> get{{feature_name.pascalCase()}}(Ref ref, {required int id}) async {
  final {{feature_name.camelCase()}}Repository = ref.watch(db{{feature_name.pascalCase()}}RepositoryProvider);

  final result = await {{feature_name.camelCase()}}Repository.get{{feature_name.pascalCase()}}(id);

  return result.fold(
    onSuccess: (data) => data,
    onFailure: (error) => throw error,
  );
}
