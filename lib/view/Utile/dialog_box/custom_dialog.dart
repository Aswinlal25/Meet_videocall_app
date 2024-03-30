import 'package:flutter/material.dart';
import 'package:meet_up/models/auth/auth_functions.dart';
import 'package:meet_up/view/Utile/colors.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kblack,
      title: Text(
        'Logout',
        style: TextStyle(
          color: kred, // Set title color
        ),
      ),
      content: Text(
        'Are you sure you want to logout?',
        style: TextStyle(
          color: Colors.black87, // Set content color
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Set dialog box border radius
      ),
      actionsPadding:
          EdgeInsets.symmetric(horizontal: 10.0), // Set padding for actions
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.green), // Set cancel button color
          ),
        ),
        TextButton(
          onPressed: () {
            AuthApi authApi = AuthApi();
            authApi.logout();
            Navigator.pop(context);
          },
          child: Text(
            'Logout',
            style: TextStyle(color: kred),
          ),
        ),
      ],
    );
  }
}
