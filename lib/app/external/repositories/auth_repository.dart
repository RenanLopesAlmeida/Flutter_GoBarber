import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Login feito com sucesso!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<Map<String, dynamic>> userAuthenticated() async {
    User user = _auth.currentUser;
    final userInfo = {
      'token': user.getIdToken(),
      'uid': user.uid,
    };

    return userInfo;
  }

  bool isAuthenticated() {
    return _auth.currentUser != null;
  }
}
