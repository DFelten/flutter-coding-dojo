import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_dojo/models/item.dart';
import 'package:flutter_coding_dojo/models/todo.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  static const routeName = '/second';

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Item> items = [
    Item(text: 'Map', icon: Icons.map),
    Item(text: 'Event', icon: Icons.event),
  ];

  List<Todo> toDos = <Todo>[];

  @override
  void initState() {
    http.get('https://jsonplaceholder.typicode.com/todos').then((response) {
      setState(() {
        final Iterable list = json.decode(response.body);
        toDos = list.map((todo) => Todo.fromJson(todo)).toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todos")),
      body: ListView.builder(
        itemCount: toDos.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(toDos[index].title),
          leading: Checkbox(
            value: toDos[index].completed,
            onChanged: (bool value) {},
          ),
        ),
      ),
    );
  }
}
