import "package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart";

class {{ feature_name.pascalCase() }}Model {
  final int _id;
  final String _name;

  const {{feature_name.pascalCase()}}Model({
    required int id,
    required String name,
  }) : _id = id, _name = name;

  int get id => _id;
  String get name => _name;

  factory {{feature_name.pascalCase()}}Model.fromEntity({{feature_name.pascalCase()}}Entity entity) => {{feature_name.pascalCase()}}Model(
    id: entity.id,
    name: entity.name,
  );

  {{#uses_db}}
  factory {{feature_name.pascalCase()}}Model.fromDbModel({{feature_name.pascalCase()}} model) => {{feature_name.pascalCase()}}Model(
    id: model.id,
    name: model.name,
  );
  {{/uses_db}}

  {{feature_name.pascalCase()}}Entity toEntity() => {{feature_name.pascalCase()}}Entity(
    id: id,
    name: name,
  );

  @override
  bool operator ==(covariant {{feature_name.pascalCase()}}Model other) => id == other.id && name == other.name;

  @override
  int get hashCode => Object.hash(id, name);

  {{feature_name.pascalCase()}}Model copyWith({
    int? id,
    String? name,
  }) => {{feature_name.pascalCase()}}Model(
    id: id ?? this.id,
    name: name ?? this.name,
  );
}