// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meet_up/models/auth/auth_functions.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';

class LoginScreen extends StatelessWidget {
  final Function()? onTap;
  LoginScreen({super.key, required this.onTap});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kblack,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 430,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('asset/login_image.jpeg'),
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
                              Colors.black,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 354,
                        left: 24,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Let's \n",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 5,
                                  wordSpacing: 1),
                            ),
                            TextSpan(
                              text: 'Meet',
                              style: TextStyle(
                                  color: kamber,
                                  fontSize: 39,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2,
                                  wordSpacing: 1),
                            )
                          ]),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: screenSize.height * 0.07,
                        width: screenSize.width * 0.9,
                        child: TextFormField(
                          controller: _emailController,
                          // initialValue: initialValue,
                          // onSaved: onSaved,
                          validator: (val) => val != null && val.isNotEmpty
                              ? null
                              : 'Required Field',
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                color: Colors
                                    .white30, // Border color in normal state
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // Border color in focused state
                                width: 2.0,
                              ),
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.white60,
                              letterSpacing: 2,
                              fontSize: 15,
                            ),
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: Colors.white60,
                              size: 20,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      kheight20,
                      Container(
                        height: screenSize.height * 0.07,
                        width: screenSize.width * 0.9,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (val) => val != null && val.isNotEmpty
                              ? null
                              : 'Required Field',
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                  color: Colors
                                      .white30, // Border color in normal state
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                  color: Colors
                                      .white, // Border color in focused state
                                  width: 2.0,
                                ),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.white60,
                                letterSpacing: 2,
                                fontSize: 15,
                              ),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.white60,
                                size: 20,
                              )),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      kheight15,
                      InkWell(
                        onTap: () {
                          AuthApi authApi = AuthApi();
                          authApi.signWithGoogle(context);
                        },
                        child: Container(
                            height: screenSize.height * 0.07,
                            width: screenSize.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors
                                    .white30, // Border color in normal state
                                width: 2.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Login with Google',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    letterSpacing: 2,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image(
                                    width: 30,
                                    height: 30,
                                    image: AssetImage('asset/Google_Logo.png'))
                              ],
                            )),
                      ),
                      kheight15,
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: onTap,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Create Account\t ",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                    color: kamber,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    wordSpacing: 1),
                              )
                            ]),
                          ),
                        ),
                      ),
                      kheight30,
                      ElevatedButton(
                        onPressed: () {
                          AuthApi authApi = AuthApi();

                          authApi.userLogin(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              context: context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kamber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: screenSize.height * 0.035,
                            width: screenSize.width * 0.15,
                            child: Center(
                              child: Text(
                                'Login',
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
          ),
        ],
      ),
    );
  }
}
