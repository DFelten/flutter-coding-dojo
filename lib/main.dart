import 'package:flutter/material.dart';
import 'package:flutter_coding_dojo/second_page.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(title: 'Flutter Coding Dojo'),
        SecondPage.routeName: (context) => SecondPage(),
      },
    );
  }
}
