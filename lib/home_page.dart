import 'package:flutter/material.dart';
import 'package:flutter_coding_dojo/second_page.dart';

class HomePage extends StatefulWidget {
  HomePage({this.title});

  final String title;
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.display1),
            RaisedButton(
              child: Text('Press'),
              onPressed: _incrementCounter,
            ),
            RaisedButton(
              child: Text('Second Page'),
              onPressed: _showSecondPage,
            )
          ],
        ),
      ),
    );
  }

  void _showSecondPage() {
    Navigator.pushNamed(context, SecondPage.routeName);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
