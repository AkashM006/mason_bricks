import 'package:{{project_name.snakeCase()}}/src/core/utils/data_state.util.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/repository/db/db_{{feature_name.snakeCase()}}.repository.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/{{feature_name.snakeCase()}}.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'side_effect_providers.g.dart';

@riverpod
class Add{{feature_name.pascalCase()}} extends _$Add{{feature_name.pascalCase()}} {
  @override
  DataState<String>? build() => null;

  Future<void> go({{feature_name.pascalCase()}}Entity new{{feature_name.pascalCase()}}) async {
    state = DataLoading();

    final todoRepository = ref.read(db{{feature_name.pascalCase()}}RepositoryProvider);

    final result = await todoRepository.add{{feature_name.pascalCase()}}(new{{feature_name.pascalCase()}});

    state = result.fold(
      onSuccess: (data) => DataSuccess("{{feature_name.sentenceCase()}} was added"),
      onFailure: (error) => DataFailure(error),
    );
  }
}

@riverpod
class Update{{feature_name.pascalCase()}} extends _$Update{{feature_name.pascalCase()}} {
  @override
  DataState<String>? build() => null;

  Future<void> go(int id, {{feature_name.pascalCase()}}Entity new{{feature_name.pascalCase()}}) async {
    state = DataLoading();

    final todoRepository = ref.read(db{{feature_name.pascalCase()}}RepositoryProvider);

    final result = await todoRepository.update{{feature_name.pascalCase()}}(id, new{{feature_name.pascalCase()}});

    state = result.fold(
      onSuccess: (data) => DataSuccess("{{feature_name.sentenceCase()}} was updated"),
      onFailure: (error) => DataFailure(error),
    );
  }
}

@riverpod
class Delete{{feature_name.pascalCase()}} extends _$Delete{{feature_name.pascalCase()}} {
  @override
  DataState<String>? build() => null;

  Future<void> go(int id) async {
    state = DataLoading();

    final todoRepository = ref.read(db{{feature_name.pascalCase()}}RepositoryProvider);

    final result = await todoRepository.delete{{feature_name.pascalCase()}}(id);

    state = result.fold(
      onSuccess: (data) => DataSuccess("{{feature_name.sentenceCase()}} was deleted"),
      onFailure: (error) => DataFailure(error),
    );
  }
}
