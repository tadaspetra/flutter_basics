import 'package:flutter/material.dart';
import 'package:layouts/customLayout.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation.index == 0) {
          return Scaffold(
            appBar: AppBar(
              title: Text("OrientationBuilder"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FourthPage())),
                  tooltip: 'Increment',
                  child: Icon(Icons.arrow_forward),
                ),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('First'),
                  ),
                  ListTile(
                    leading: Icon(Icons.bookmark),
                    title: Text('Third'),
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Third'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Row(
                children: <Widget>[
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.selected,
                    destinations: const <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite_border),
                        selectedIcon: Icon(Icons.favorite),
                        label: Text('First'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.bookmark_border),
                        selectedIcon: Icon(Icons.book),
                        label: Text('Third'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.star_border),
                        selectedIcon: Icon(Icons.star),
                        label: Text('Third'),
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  // This is the main content.
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'You have pushed the button this many times:',
                          ),
                          Text(
                            '$_counter',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FourthPage())),
                  child: Icon(Icons.arrow_forward),
                ),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
