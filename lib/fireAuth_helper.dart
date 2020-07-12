import 'package:firebase_auth/firebase_auth.dart';

class FireAuthHelper {
  FireAuthHelper._();
  static FireAuthHelper fireAuthHelper = FireAuthHelper._();
  FirebaseAuth firebaseAuth;
  FirebaseAuth initFireAuth() {
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
      return firebaseAuth;
    } else {
      return firebaseAuth;
    }
  }

  Future<String> registerByEmailAndPassword(
      String email, String password) async {
    firebaseAuth = initFireAuth();
    firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<String> loginByEmailAndPassword(String email, String password) async {
    firebaseAuth = initFireAuth();
    try {
      firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      throw error;
    }
  }

  signOutFromDevice() {
    firebaseAuth = initFireAuth();
    firebaseAuth.signOut();
  }

  Future<bool> checkUserLogin() async {
    firebaseAuth = initFireAuth();
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    return firebaseUser != null;
  }
}
