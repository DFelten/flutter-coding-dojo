import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_coding_dojo/bloc/bloc.dart';
import 'package:flutter_coding_dojo/models/todo.dart';

import 'package:http/http.dart' as http;

class SecondScreenBloc extends Bloc<SecondScreenEvent, SecondScreenState> {
  @override
  SecondScreenState get initialState => SecondScreenUninitialized();

  @override
  Stream<SecondScreenState> mapEventToState(SecondScreenEvent event) async* {
    if (event is FetchTodos) {
      yield* _mapFetchTodosToState();
    }
  }

  Stream<SecondScreenState> _mapFetchTodosToState() async* {
    final response = await http.get('https://jsonplaceholder.typicode.com/todos');
    final Iterable list = json.decode(response.body);
    List<Todo> todos = list.map((todo) => Todo.fromJson(todo)).toList();

    yield TodosLoaded(todos);
  }
}
