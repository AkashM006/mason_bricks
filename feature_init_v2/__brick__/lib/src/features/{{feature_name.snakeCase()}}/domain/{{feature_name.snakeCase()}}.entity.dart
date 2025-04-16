import 'package:freezed_annotation/freezed_annotation.dart';

part '{{feature_name.snakeCase()}}.entity.freezed.dart';
part '{{feature_name.snakeCase()}}.entity.g.dart';

@freezed
abstract class {{feature_name.pascalCase()}}Entity with _${{feature_name.pascalCase()}}Entity {
  const factory {{feature_name.pascalCase()}}Entity({@Default(-1) int id, required String name}) =
      _{{feature_name.pascalCase()}}Entity;

  factory {{feature_name.pascalCase()}}Entity.fromJson(Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}EntityFromJson(json);

  factory {{feature_name.pascalCase()}}Entity.init() => {{feature_name.pascalCase()}}Entity(name: "");

  factory {{feature_name.pascalCase()}}Entity.placeholder() => {{feature_name.pascalCase()}}Entity(name: "placeholder");
}
