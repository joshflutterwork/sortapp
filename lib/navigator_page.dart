import 'package:flutter/material.dart';
import 'package:sortapp/explore.dart';
import 'package:sortapp/home.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  PageController _pageController =
      PageController(initialPage: 0, keepPage: false);
  int bottomSelectedIndex = 0;

  Future bottomTapped(int index) async {
    bottomSelectedIndex = index;
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);

    setState(() {});
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Container(child: Icon(Icons.home)), label: ''),
      BottomNavigationBarItem(
          icon: Container(child: Icon(Icons.explore)), label: ''),
    ];
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white54,
      currentIndex: bottomSelectedIndex,
      onTap: (index) {
        bottomTapped(index);
        setState(() {});
      },
      items: buildBottomNavBarItems(),
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  Widget getPageViewAdmin() => PageView(
        controller: _pageController,
        children: [HomePage(), ExplorePage()],
        onPageChanged: (index) {
          pageChanged(index);
        },
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        body: getPageViewAdmin(),
        bottomNavigationBar: bottomNavigation());
  }
}
