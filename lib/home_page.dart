import 'package:flutter/material.dart';
import 'package:tabbed_app/home_widget.dart';
import 'package:tabbed_app/profile_widget.dart';
import 'package:tabbed_app/search_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<BottomNavigationBarItem> _navigationBarItems = [
    BottomNavigationBarItem(
      title: Text('Home'),
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      title: Text('Search'),
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      title: Text('Profile'),
      icon: Icon(Icons.account_circle),
    ),
  ];

  Widget _currentWidget = HomeWidget();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _currentWidget = HomeWidget();
          break;
        case 1:
          _currentWidget = SearchWidget();
          break;
        case 2:
          _currentWidget = ProfileWidget();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
      body: _currentWidget,
    );
  }
}
