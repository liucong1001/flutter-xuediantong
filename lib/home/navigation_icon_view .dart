import 'package:flutter/material.dart';


class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    item = BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      title: Text(title),
      backgroundColor: Colors.white,
    );
}