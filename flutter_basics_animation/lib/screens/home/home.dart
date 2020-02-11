import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool big = false;
  AnimationController _animationController;

  double _start = 12;
  double _end = 24;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 10), vsync: this)
      ..forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //Implicit Animation
            AnimatedContainer(
              duration: Duration(seconds: 2),
              child: Image.asset("images/cat.jpg"),
              height: big ? 200 : 40,
              curve: Curves.easeInQuart,
            ),
            RaisedButton(
              child: Text("Animate"),
              onPressed: () {
                setState(() {
                  big = !big;
                });
              },
            ),
            RotationTransition(
              turns: _animationController,
              alignment: Alignment.center,
              child: Image.asset("images/cat.jpg"),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: _start, end: _end),
              duration: Duration(seconds: 2),
              builder: (BuildContext buildContext, double size, Widget child) {
                return Column(
                  children: <Widget>[
                    Text(
                      "Animate",
                      style: TextStyle(fontSize: size),
                    ),
                    RaisedButton(
                      child: Text("Animate"),
                      onPressed: () {
                        setState(() {
                          double temp = _end;
                          _end = _start;
                          _start = temp;
                        });
                      },
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
