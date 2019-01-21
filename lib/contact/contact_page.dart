import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: new Text('通讯录'),
      ),
      body:new Text('通讯录页面'), 
    );
  }
}