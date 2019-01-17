import 'package:flutter/material.dart';
import '../common/base_style.dart';

import '../msg/msg_page.dart';
import '../task/task_page.dart';
import '../home/home_index_page.dart';
import '../contact/contact_page.dart';
import '../center/center_page.dart';
import 'navigation_icon_view .dart';
// import '../constants.dart' show AppColors, AppStyles, Constants;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _pageController;
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;

  void initState() { 
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '消息',
        icon: IconData(
          0xe69a,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe69a,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '作业',
        icon: IconData(
          0xe625,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe625,
          fontFamily: Constants.IconFontFamily,
        )
      ),
      NavigationIconView(
        title: '主页',
        icon: IconData(
          0xec7f,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xec7f,
          fontFamily: Constants.IconFontFamily,
        )
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe649,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe649,
          fontFamily: Constants.IconFontFamily,
        )
      ),
      NavigationIconView(
        title: '我的',
        icon: IconData(
          0xe607,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe607,
          fontFamily: Constants.IconFontFamily,
        )
      ),
    ];
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      MsgPage(),
      TaskPage(),
      HomeIndexPage(),
      ContactPage(),
      CenterPage(),
    ];
  }




  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;

          _pageController.animateToPage(_currentIndex, 
            duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title:const Text('学点通'),
      ),
      body:PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}