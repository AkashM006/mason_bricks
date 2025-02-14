import "package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart"

class {{ feature_name.pascalCase() }}Model {
  final int _id;

  const {{feature_name.pascalCase()}}Model({
    required int id,
  }) : _id = id;

  int get id => _id;

  factory {{feature_name.pascalCase()}}Model.fromEntity({{feature_name.pascalCase()}}Entity entity) => {{feature_name.pascalCase()}}(
    id: entity.id,
  );

  {{feature_name.pascalCase()}}Entity toEntity() => {{feature_name.pascalCase()}}(
    id: id,
  );

  @override
  bool operator ==(covariant {{feature_name}}Model other) => id == other.id;

  @override
  int get hashCode => Object.hash(id);

  {{feature_name.pascalCase()}}Model copyWith({
    int? id,
  }) => {{feature_name.pascalCase()}}(
    id: id ?? this.id,
  );
}