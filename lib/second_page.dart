import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_dojo/bloc/bloc.dart';
import 'package:flutter_coding_dojo/models/item.dart';
import 'package:flutter_coding_dojo/models/todo.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  static const routeName = '/second';

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SecondScreenBloc _bloc;

  @override
  void initState() {
    _bloc = SecondScreenBloc();
    _bloc.add(FetchTodos());
    super.initState();
  }

  Widget _buildList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(todos[index].title),
        leading: Checkbox(
          value: todos[index].completed,
          onChanged: (bool value) {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todos")),
      body: BlocBuilder<SecondScreenBloc, SecondScreenState>(
        bloc: _bloc,
        builder: (BuildContext context, SecondScreenState state) {
          return (state is TodosLoaded) ? _buildList(state.todos) : Text('Loading');
        },
      ),
    );
  }
}
