import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  Todo({this.userId, this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  final int userId;
  final int id;
  final String title;
  final bool completed;
}
