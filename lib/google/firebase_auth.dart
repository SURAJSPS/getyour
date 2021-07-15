import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getyour/auth/login.dart';

Future<User?> creatAccount({
  String? name,
  String? email,
  String? phoneNumber,
  String? password,
  String? conformPassword,
}) async {
  try {
    if (email != null && password != null) {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential);

      await FirebaseFirestore.instance
          .collection('user_info')
          .doc(userCredential.user?.uid)
          .set({
        'userName': name,
        'userEmail': email,
        'userPhone': password,
        'userPassword': password,
      });
    }
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print(currentUser.uid);
      print('Account Creat ');
      return currentUser;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<User?> loginAccount(String? email, String? password) async {
  try {
    if (email != null && password != null) {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print(currentUser.uid);
      print('hello');
      return currentUser;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

Future<User?> logOutAccount(context) async {
  try {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LogIn()));
    });
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}
