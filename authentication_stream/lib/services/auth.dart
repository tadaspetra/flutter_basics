import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reference/models/user.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(
      (FirebaseUser firebaseUser) => (firebaseUser != null) ? User(uid: firebaseUser.uid) : null,
    );
  }

  Future<void> signInUserWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: _googleAuth.idToken,
        accessToken: _googleAuth.accessToken,
      );
      await _auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOutUser() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
