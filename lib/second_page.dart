import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_dojo/models/item.dart';

class SecondPage extends StatelessWidget {
  static const routeName = '/second';

  List<Item> items = [
    Item(text: 'Map', icon: Icons.map),
    Item(text: 'Event', icon: Icons.event),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          leading: Icon(items[index].icon),
          title: Text(items[index].text),
        ),
      ),
    );
  }
}

