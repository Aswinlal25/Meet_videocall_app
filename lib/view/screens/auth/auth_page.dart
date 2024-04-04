import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/models/auth/auth_functions.dart';
import 'package:meet_up/view/screens/home_screen/home_screen.dart';
import 'package:meet_up/view/screens/login_or_signup_page/login_or_signup.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // if user is logged in
            return HomeScreen();
          } else {
            // if user is Not logged in
            return LoginOrSignUpPage();
          }
        },
      ),
    );
  }
}
// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   bool isUserLoggedIn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData && !isUserLoggedIn) {
//             // If user is logged in and onUserLogin has not been called yet
//             onUserLogin();
//             isUserLoggedIn =
//                 true; // Update the flag to indicate that onUserLogin has been called
//             return HomeScreen();
//           } else if (snapshot.hasData && isUserLoggedIn) {
//             // If user is logged in and onUserLogin has already been called
//             return HomeScreen();
//           } else {
//             // If user is not logged in
//             return LoginOrSignUpPage();
//           }
//         },
//       ),
//     );
//   }
// }

// void onUserLogin() {
//   print('Executing onUserLogin...');
//   if (userModel != null) {
//     print('User model is not null. Initializing Zego Cloud SDK...');
//     ZegoUIKitPrebuiltCallInvitationService().init(
//       appID: 687637959,
//       appSign:
//           "f03e62d0c1d7469ddb2211b4b44a3143199e5dfa18b6c16f3907800182feeecd",
//       userID: userModel!.id,
//       userName: userModel!.username,
//       plugins: [ZegoUIKitSignalingPlugin()],
//     );
//   } else {
//     print('User model is null. Cannot initialize Zego Cloud SDK.');
//   }
// }
