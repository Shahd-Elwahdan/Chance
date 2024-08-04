// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static final auth = FirebaseAuth.instance;
  static createuser(String email, String pass) async {
    await auth.createUserWithEmailAndPassword(email: email, password: pass);
  }

  static login(String email, String pass) async {
    await auth.signInWithEmailAndPassword(email: email, password: pass);
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }

  static Future<bool> logeedin() async {
    return auth.currentUser != null;
  }
}
