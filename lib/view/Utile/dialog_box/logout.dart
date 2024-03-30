// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meet_up/models/auth/auth_functions.dart';
import 'package:meet_up/view/Utile/colors.dart';

class CustomDialog extends StatelessWidget {
  static const IconData heart_broken_sharp =
      IconData(0xf0421, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: kblack,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.white30, // Border color in normal state
              width: 2.0,
            ),
            // color: Color.fromARGB(255, 28, 28, 28),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 68),
                          Text(
                            "Are you sure you want to log out \nof your account?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white60,
                                letterSpacing: 0.4,
                                wordSpacing: 1),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 35),
                          ElevatedButton(
                            onPressed: () {
                              try {
                                {
                                  AuthApi authApi = AuthApi();
                                  authApi.logout();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              } catch (e) {
                                print('Error: $e');
                                // Handle any exceptions here
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              // Color.fromARGB(255, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SizedBox(
                                height: 20,
                                width: 90,
                                child: Center(
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: kblack,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white38,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 73,
                    right: 105,
                    child: Transform.rotate(
                      angle: -1.5708, // Angle in radians (90 degrees)
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 70,
                            color: Colors.white12,
                            letterSpacing: 0.4,
                            wordSpacing: 1),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
