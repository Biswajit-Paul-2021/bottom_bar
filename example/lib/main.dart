import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(color: Colors.blue),
          Container(color: Colors.red),
          Container(color: Colors.greenAccent.shade700),
          Container(color: Colors.orange),
          Container(color: Colors.blue),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        iconSize: 22,
        height: kBottomNavigationBarHeight + 30,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.bubble_chart),
            title: Text('Dashboard'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.connect_without_contact),
            title: Text('Connects'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text('Orders'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.supervised_user_circle),
            title: Text('Doctors'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.library_books_sharp),
            title: Text('Cards'),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
