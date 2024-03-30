import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meet_up/models/current_user_model.dart';

UserModel? userModel;

class AuthApi {
  void userLogin({email, password, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String errorMsg;
      if (e.code == 'user-not-found') {
        errorMsg = 'User not found for that email';
      } else if (e.code == 'wrong-password') {
        errorMsg = 'Wrong password provided for that user';
      } else {
        errorMsg = 'Login with proper Email and Password';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
        ),
      );
    }
  }

  void createUser({email, password, username}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
        'username': username,
        'about': '',
        'image': '',
        'email': email,
      }).then((_) => print('User added to Firestore successfully!'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('------The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('------The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  signWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = FirebaseAuth.instance.currentUser;
      final email = authResult.user!.email;
      final username = authResult.user!.displayName;
      final userDoc = await FirebaseFirestore.instance
          .collection("users")
          .where('email', isEqualTo: email)
          .get();
      if (userDoc.docs.isEmpty) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .set({
          'username': username,
          'about': '',
          'image': '',
          'email': email,
        }).then((_) => print('User added to Firestore successfully!'));
      } else {
        print('Document already exists for current user.');
      }
    } catch (error) {
      print(
          " -----------------------------Error signing in with Google: $error");
    }
  }
}

void getUserData() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    String currentUserUid = user.uid;

    // Fetch the document corresponding to the current user's UID
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserUid)
        .get();

    if (userDoc.exists) {
      UserModel currentUser = UserModel.fromJson(
          userDoc.id, userDoc.data() as Map<String, dynamic>);
      UserModel(
          email: currentUser.email,
          id: currentUser.id,
          username: currentUser.username,
          about: currentUser.about,
          image: currentUser.image);

      print("------------------------${userDoc.id} => ${userDoc.data()}");
    } else {
      print("Document not found for current user.");
    }
  } else {
    print('No user signed in.');
  }
}

// void getUserDetails() {
//   User? user = FirebaseAuth.instance.currentUser;

//   if (user != null) {
//     // Create a UserModel instance from the user details
//     UserModel currentUser = UserModel.fromFirebase(user);

//     print('Display Name: ${currentUser.displayName}');
//     print('Email: ${currentUser.email}');
//     print('Photo URL: ${currentUser.photoURL}');
//     print('UID: ${currentUser.uid}');
//   } else {
//     print('No user signed in.');
//   }
// }

final snackBar = SnackBar(
  content: Text('This is a snackbar'),
  action: SnackBarAction(
    label: 'Close',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);

void getUserDetails() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String currentUserUid = user.uid;

    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserUid)
        .get();

    if (userDoc.exists) {
      userModel = UserModel.fromJson(
        userDoc.id,
        userDoc.data() as Map<String, dynamic>,
      );
    } else {
      print("Document not found for current user.");
    }
  } else {
    print('No user signed in.');
  }
}
