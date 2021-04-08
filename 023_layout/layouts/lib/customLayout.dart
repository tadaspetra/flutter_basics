import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMultiChildLayout(
        delegate: YourLayoutDelegate(position: Offset.zero),
        children: [
          LayoutId(
            id: 1,
            child: Text('Widget one'),
          ),
          LayoutId(
            id: 2,
            child: Text('Widget two'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon((Icons.arrow_back)),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class YourLayoutDelegate extends MultiChildLayoutDelegate {
  YourLayoutDelegate({this.position});

  final Offset position;

  @override
  void performLayout(Size size) {
    Size leadingSize = Size.zero;

    if (hasChild(1)) {
      leadingSize = layoutChild(
        1,
        BoxConstraints.loose(size),
      );
    }

    if (hasChild(2)) {
      layoutChild(
        2,
        BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        ),
      );

      positionChild(
        2,
        Offset(
          leadingSize.width,
          size.height / 2,
        ),
      );
    }
  }

  @override
  bool shouldRelayout(YourLayoutDelegate oldDelegate) {
    return oldDelegate.position != position;
  }
}
