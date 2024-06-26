import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meet_up/models/current_user_model.dart';
import 'package:meet_up/view/screens/user_create_screen/user_create_screen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

UserModel? userModel;

class AuthApi {
  void userLogin({email, password, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onUserLogin();
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

  void onUserLogin() {
    print('it zegocloud function in called!!!');
    if (userModel != null) {
      print('----------------------it zegocloud function in called!!!');
      ZegoUIKitPrebuiltCallInvitationService().init(
        appID: 687637959,
        appSign:
            "f03e62d0c1d7469ddb2211b4b44a3143199e5dfa18b6c16f3907800182feeecd",
        userID: userModel!.id,
        userName: userModel!.username,
        plugins: [ZegoUIKitSignalingPlugin()],
      );
    }
  }

  Future<bool> createUser({email, password, username, context}) async {
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
      onUserLogin();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => UserCreateScreen()));
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('------The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('------The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }

  signWithGoogle(context) async {
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
        onUserLogin();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => UserCreateScreen()));
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

Future<List<UserModel>> getAllUsers() async {
  List<UserModel> users = [];
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("users").get();

    if (querySnapshot.docs.isNotEmpty) {
      users = querySnapshot.docs.map((doc) {
        return UserModel.fromJson(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } else {
      print("No users found.");
    }
  } catch (error) {
    print("Error getting users: $error");
  }
  return users;
}
