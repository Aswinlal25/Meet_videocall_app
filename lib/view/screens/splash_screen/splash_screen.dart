import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';
import 'package:meet_up/view/screens/auth/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const AuthPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdark,
      appBar: null,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/Screenshot 2024-03-07 154212.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.4),
                Colors.transparent,
                Colors.transparent,
                Colors.black.withOpacity(0.6),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight50,
                kheight30,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'M\n',
                    style: TextStyle(
                      color: fkwhite,
                      fontSize: 110,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: 'E\n',
                    style: TextStyle(
                      color: kamber,
                      fontSize: 110,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: 'E\nT',
                    style: TextStyle(
                      color: fkwhite,
                      fontSize: 110,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ])),
                // Text(
                //   'M\nE\nE\nT',
                //   style: TextStyle(
                //     color: fkwhite,
                //     fontSize: 110,
                //     fontWeight: FontWeight.w800,
                //   ),
                // ),
                kheight50,
                kheight30,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Connect ',
                        style: TextStyle(
                          color: fkwhite,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      TextSpan(
                        text: 'face to face ',
                        style: TextStyle(
                          color: kamber,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      TextSpan(
                        text: 'virtually\nYour Gateway to Seamless ',
                        style: TextStyle(
                          color: fkwhite,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      TextSpan(
                        text: 'Video Calls',
                        style: TextStyle(
                          color: kamber,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
