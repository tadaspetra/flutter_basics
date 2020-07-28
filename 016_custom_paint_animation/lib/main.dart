import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(
    MaterialApp(
      home: First(),
    ),
  );
}

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  int counter = 0;

  void _increaseCount() {
    if (counter < 3) {
      counter++;
    } else {
      counter = 0;
    }
    setState(() {});
  }

  double _fromTop(double maxHeight) {
    switch (counter) {
      case 0:
        return 0;
        break;
      case 1:
        return maxHeight - 80;
        break;
      case 2:
        return maxHeight - 80;
        break;
      case 3:
        return 0;
        break;
      default:
        return 0;
    }
  }

  double _fromLeft(double maxWidth) {
    switch (counter) {
      case 0:
        return 0;
        break;
      case 1:
        return 0;
        break;
      case 2:
        return maxWidth - 80;
        break;
      case 3:
        return maxWidth - 80;
        break;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Livestream Boys"),
        actions: <Widget>[
          IconButton(
            onPressed: _increaseCount,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(children: <Widget>[
            AnimatedPositioned(
              duration: Duration(seconds: 2),
              left: _fromLeft(constraints.maxWidth),
              top: _fromTop(constraints.maxHeight),
              child: CustomPaint(
                painter: MyPainter(),
                size: Size(constraints.maxWidth, constraints.maxHeight),
              ),
              onEnd: _increaseCount,
            ),
          ]);
        },
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint facePaint = Paint()..color = Colors.yellow;
    canvas.drawCircle(Offset(40, 40), 40, facePaint);

    //the two eyebrows
    Paint linePaint = Paint()..strokeWidth = 2;
    canvas.drawLine(Offset(15, 20), Offset(35, 30), linePaint);
    canvas.drawLine(Offset(65, 20), Offset(45, 30), linePaint);

    //the two eyes
    Paint circlePaint = Paint();
    canvas.drawCircle(Offset(23, 35), 5, circlePaint);
    canvas.drawCircle(Offset(57, 35), 5, circlePaint);

    //the mouth
    Paint arcPaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    Rect rect = Rect.fromLTWH(21, 50, 40, 20);
    canvas.drawArc(rect, math.pi, math.pi, true, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
