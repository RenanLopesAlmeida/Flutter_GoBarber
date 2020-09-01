import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gobarber/app/external/interfaces/auth_interface.dart';

class AuthRepository extends AuthInterface {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<String> getUserFullName() async {
    DocumentSnapshot currentUser =
        await usersCollection.doc(_auth.currentUser.uid).get();
    final extractedData = currentUser.data();

    return extractedData['name'].toString();
  }

  Future<String> getUserFirstName() {
    return getUserFullName().then(
      (value) {
        return value.toString().split(' ')[0];
      },
    );
  }

  Future<void> register(String name, String email, String password) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      usersCollection.doc(user.user.uid).set({
        'name': name,
        'email': email,
      }).then((value) {
        user.user.updateProfile(displayName: name);
      }).catchError((error) {
        print(
            'ERROR WHEN TRIED TO CREATE A USER COLLECTION IN FIRESTORE. ERRO: $error');
      });
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
    return (_auth.currentUser != null);
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      print('Logout succesfully!');
    } catch (error) {
      print('Could not logged out: $error');
    }
  }
}
