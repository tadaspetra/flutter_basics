import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  Firestore _firestore = Firestore.instance;

  String _retrievedImageUrl;

  Future getImage() async {
    try {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
      });
    } catch (e) {
      print(e);
    }
  }

  Future uploadImage() async {
    try {
      final StorageReference storageReference = FirebaseStorage().ref().child("profilePicture");

      final StorageUploadTask uploadTask = storageReference.putFile(_image);

      final StreamSubscription<StorageTaskEvent> streamSubscription =
          uploadTask.events.listen((event) {
        // You can use this to notify yourself or your user in any kind of way.
        // For example: you could use the uploadTask.events stream in a StreamBuilder instead
        // to show your user what the current status is. In that case, you would not need to cancel any
        // subscription as StreamBuilder handles this automatically.

        // Here, every StorageTaskEvent concerning the upload is printed to the logs.
        print('EVENT ${event.type}');
      });

      // Cancel your subscription when done.
      await uploadTask.onComplete;
      streamSubscription.cancel();

      String imageUrl = await storageReference.getDownloadURL();
      await _firestore.collection("users").document("user1").setData({
        "profilePicture": imageUrl,
      });
    } catch (e) {
      print(e);
    }
  }

  Future retrieveImage() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await _firestore.collection("users").document("user1").get();
      setState(() {
        _retrievedImageUrl = documentSnapshot.data["profilePicture"];
      });
    } catch (e) {
      print(e);
    }
  }

  Future uploadMultipleImages() async {
    List<File> _imageList = List();
    List<String> _imageUrls = List();

    _imageList.add(_image);
    _imageList.add(_image);
    _imageList.add(_image);

    try {
      for (int i = 0; i < _imageList.length; i++) {
        final StorageReference storageReference = FirebaseStorage().ref().child("multiple2/$i");

        final StorageUploadTask uploadTask = storageReference.putFile(_imageList[i]);

        final StreamSubscription<StorageTaskEvent> streamSubscription =
            uploadTask.events.listen((event) {
          // You can use this to notify yourself or your user in any kind of way.
          // For example: you could use the uploadTask.events stream in a StreamBuilder instead
          // to show your user what the current status is. In that case, you would not need to cancel any
          // subscription as StreamBuilder handles this automatically.

          // Here, every StorageTaskEvent concerning the upload is printed to the logs.
          print('EVENT ${event.type}');
        });

        // Cancel your subscription when done.
        await uploadTask.onComplete;
        streamSubscription.cancel();

        String imageUrl = await storageReference.getDownloadURL();
        _imageUrls.add(imageUrl); //all all the urls to the list
      }
      //upload the list of imageUrls to firebase as an array
      await _firestore.collection("users").document("user1").setData({
        "arrayOfImages": _imageUrls,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Storage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: (_retrievedImageUrl != null)
                  ? Image.network(_retrievedImageUrl)
                  : Text("no image retrieved"),
              height: 300,
            ),
            RaisedButton(
              child: Text("Choose Image"),
              onPressed: () {
                getImage();
              },
            ),
            RaisedButton(
              child: Text("Upload"),
              onPressed: () {
                uploadImage();
              },
            ),
            RaisedButton(
              child: Text("Retrieve Image"),
              onPressed: () {
                retrieveImage();
              },
            ),
            RaisedButton(
              child: Text("Upload List"),
              onPressed: () {
                uploadMultipleImages();
              },
            ),
          ],
        ),
      ),
    );
  }
}
