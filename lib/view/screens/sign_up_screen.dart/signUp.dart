// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meet_up/models/auth/auth_functions.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';
// import 'package:meet_up/view/screens/user_create_screen/user_create_screen.dart';

class SignUpScreen extends StatelessWidget {
  final Function()? onTap;
  SignUpScreen({super.key, this.onTap});

  final _nameController = TextEditingController();
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
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('asset/SignUp_image.jpeg'),
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
                        top: 194,
                        left: 24,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Connecting smiles across ",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                  wordSpacing: 1),
                            ),
                            TextSpan(
                              text: 'miles',
                              style: TextStyle(
                                  color: kamber,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
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
                      kheight10,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Create \n",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 5,
                                  wordSpacing: 1),
                            ),
                            TextSpan(
                              text: 'Account',
                              style: TextStyle(
                                  color: kamber,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2,
                                  wordSpacing: 1),
                            )
                          ]),
                        ),
                      ),
                      kheight30,
                      Container(
                        height: screenSize.height * 0.07,
                        width: screenSize.width * 0.9,
                        child: TextFormField(
                          controller: _nameController,
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
                            hintText: 'Name',
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
                              Icons.email,
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
                      kheight20,
                      kheight15,
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: onTap,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Already have account\t ",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2,
                                ),
                              ),
                              TextSpan(
                                text: 'Login',
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

                          authApi.createUser(
                              context: context,
                              username: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim());
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => UserCreateScreen()));
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
                                'Sign Up',
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
