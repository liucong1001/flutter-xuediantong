import 'package:flutter/material.dart';
import './home/home_page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '学点通',
      home: HomePage(),
      theme: new ThemeData(
        // #1482ff
          // brightness: Color(''),
          // primaryColor: Colors.lightBlue[800],
          //  accentColor: Colors.cyan[600],
      ),
    );
  }
}