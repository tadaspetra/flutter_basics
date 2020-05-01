import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reference/models/books.dart';

class Database {
  final Firestore _firestore = Firestore.instance;

  Stream<List<Book>> get books {
    return _firestore.collection("books").snapshots().map((event) => event.documents
        .map((DocumentSnapshot documentSnapshot) => Book(name: documentSnapshot.data["name"]))
        .toList());
  }
}
