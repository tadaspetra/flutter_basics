import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final _firestore = Firestore.instance;

  Future<String> getName() async {
    String retVal;

    try {
      DocumentSnapshot doc = await _firestore.collection("data").document("1234").get();
      retVal = doc.data["name"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> getLocalName() async {
    return Future.delayed(Duration(seconds: 3)).then((value) => "Delayed");
  }
}
