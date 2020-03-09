import 'package:flutter/material.dart';

class Following extends ChangeNotifier {
  final List<String> _followingList = [];

  List<String> get followingList => _followingList;

  add(String name) {
    _followingList.add(name);
    notifyListeners();
  }

  remove(String name) {
    _followingList.removeWhere((element) => element == name);
    notifyListeners();
  }
}
