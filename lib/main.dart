import 'package:flutter/material.dart';
import './home/home_page.dart';
import './common/base_style.dart'  show AppColors;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '学点通',
      home: HomePage(),
      theme: new ThemeData(
        primaryColorDark:Color(AppColors.ThemeDataColor),
      ),
    );
  }
}