import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  Navigation({Key key}) : super(key: key);

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _whichScreen() {
    Widget retVal;

    switch (_selectedIndex) {
      case 0:
        retVal = Center(child: Text("First Screen"));
        break;
      case 1:
        retVal = Center(child: Text("Second Screen"));
        break;
      case 2:
        retVal = Center(child: Text("Third Screen"));
        break;
      default:
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text("First"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: Text("Second"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text("Third"),
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.selected,
            unselectedIconTheme: IconThemeData(color: Colors.grey[800]),
            selectedIconTheme: IconThemeData(color: Colors.red),
            selectedLabelTextStyle: TextStyle(color: Colors.red),
            backgroundColor: Colors.white,
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: _whichScreen(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            title: Text(
              "First",
              style: TextStyle(color: Colors.red),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            title: Text(
              "Second",
              style: TextStyle(color: Colors.red),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            activeIcon: Icon(Icons.star),
            title: Text(
              "Third",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: Colors.grey[800]),
        selectedIconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.white,
      ),
    );
  }
}
