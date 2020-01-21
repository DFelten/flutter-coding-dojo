import 'package:flutter_coding_dojo/models/todo.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SecondScreenState {}

class SecondScreenUninitialized extends SecondScreenState {}

class TodosLoaded extends SecondScreenState {
  TodosLoaded(this.todos);

  final List<Todo> todos;
}
