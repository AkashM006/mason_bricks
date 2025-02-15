import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.entity.dart';

class {{feature_name.pascalCase()}}Dto {
  final int _id;
  final String _name;

  const {{feature_name.pascalCase()}}Dto({
    int id = -1,
    required String name,
  }) : _id = id, _name = name;

  int get id => _id;
  String get name => _name;

  {{feature_name.pascalCase()}}Dto copyWith({
    int? id,
    String? name,
  }) => {{feature_name.pascalCase()}}Dto(
    id: id ?? this.id,
    name: name ?? this.name,
  );

  factory {{feature_name.pascalCase()}}Dto.init() => {{feature_name.pascalCase()}}Dto(
    name: "",
  );

  factory {{feature_name.pascalCase()}}Dto.fromEntity({{feature_name.pascalCase()}}Entity entity) => {{feature_name.pascalCase()}}Dto(
    id: entity.id,
    name: entity.name,
  );

  {{feature_name.pascalCase()}}Entity toEntity() => {{feature_name.pascalCase()}}Entity(
    id: id,
    name: name,
  );

  @override
  bool operator ==(covariant {{feature_name.pascalCase()}}Dto other) =>
      id == other.id && name == other.name;

  @override
  int get hashCode => Object.hash(id, name);
}