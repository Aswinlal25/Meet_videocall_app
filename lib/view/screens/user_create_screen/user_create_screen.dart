// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';
import 'package:meet_up/view/screens/home_screen/home_screen.dart';

class UserCreateScreen extends StatelessWidget {
  const UserCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kblack,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 30),
              Lottie.asset(
                'asset/animations/Animation - 1711825028881.json',
                fit: BoxFit.cover,
                repeat: false,
              ),
            ],
          ),
          Positioned(
            top: 360,
            left: 30,
            child: Column(
              children: [
                Text(
                  'Your account',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontSize: 27,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  'successfully created!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontSize: 27,
                    letterSpacing: 1,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(
                      "Join the conversation, share experiences,\n\t    and explore the power of real-time\n        communication with just a tap",
                      style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                kheight50,
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kamber,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: kamber, width: 2),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: screenSize.height * 0.035,
                      width: screenSize.width * 0.5,
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              color: kblack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
