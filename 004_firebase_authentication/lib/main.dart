import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResult _authResult;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  void _signUp(String email, String password) async {
    try {
      _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("Account created for user: " + _authResult.user.email);
      _authResult.user.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  void _logIn(String email, String password) async {
    try {
      _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (_authResult.user.isEmailVerified) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
      } else {
        print("YOU NEED TO VERIFY EMAIL");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _passController,
              ),
            ),
            RaisedButton(
              child: Text("Sign Up"),
              onPressed: () {
                _signUp(_emailController.text, _passController.text);
              },
            ),
            RaisedButton(
              child: Text("Log In"),
              onPressed: () {
                _logIn(_emailController.text, _passController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signed In"),
      ),
    );
  }
}
