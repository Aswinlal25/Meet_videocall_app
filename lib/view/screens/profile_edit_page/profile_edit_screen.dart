// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kblack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kgrey,
                      ),
                      child: Icon(
                        CupertinoIcons.back,
                        color: fkwhite,
                      ),
                    ),
                  ),
                  kheight50,
                  kheight50,
                  kheight50,
                  kheight20,
                  Container(
                    width: double.infinity,
                    height: 490,
                    decoration: BoxDecoration(
                      color: kgrey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          kheight30,
                          kheight50,
                          Container(
                            height: screenSize.height * 0.07,
                            width: screenSize.width * 0.9,
                            child: TextFormField(
                              // controller: _passwordController,

                              validator: (val) => val != null && val.isNotEmpty
                                  ? null
                                  : 'Required Field',
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .white30, // Border color in normal state
                                    width: 2.0,
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.all(screenSize.width * 0.05),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .amber, // Border color in focused state
                                    width: 2.0,
                                  ),
                                ),
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          kheight30,
                          Container(
                            height: screenSize.height * 0.23,
                            width: screenSize.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    color: Colors.white30, width: 2)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenSize.width * 0.02,
                                  top: screenSize.height * 0.005),
                              child: TextFormField(
                                // controller: bioController,
                                keyboardType: TextInputType.multiline,
                                maxLines:
                                    null, // Set to null for unlimited lines
                                style: TextStyle(
                                  color: kwhite,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'About',
                                  hintStyle: TextStyle(
                                    color: Colors.white38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.all(screenSize.width * 0.02),
                                ),
                                validator: (value) {
                                  if (value == null) return null;
                                  return null;
                                },
                              ),
                            ),
                          ),
                          kheight30,
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {},
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
                                      'Save',
                                      style: TextStyle(
                                          fontSize: screenSize.width * 0.04,
                                          color: kblack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 80,
                right: 90,
                child: InkWell(
                  onDoubleTap: () {},
                  onTap: () {
                    // pickImage();
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kamber,
                      ),
                      child: Center(
                        child: Container(
                          width: 175,
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kblack,
                          ),
                          child: Center(
                            child: Hero(
                              tag: 'currentUserPicture',
                              child:
                                  //  _image != null
                                  //     ? Container(
                                  //         width: 170,
                                  //         height: 170,
                                  //         decoration: BoxDecoration(
                                  //           borderRadius: BorderRadius.circular(25),
                                  //           image: DecorationImage(
                                  //             image: FileImage(File(_image!.path)),
                                  //             fit: BoxFit.cover,
                                  //           ),
                                  //         ),
                                  //       )
                                  //     :
                                  //  userModel != null &&
                                  //         userModel!.image != null &&
                                  //         userModel!.image!.isNotEmpty
                                  //     ?
                                  // Container(
                                  //     width: 170,
                                  //     height: 170,
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(25),
                                  //       image: DecorationImage(
                                  //         image: AssetImage('asset/placeholderimage.webp'),
                                  //         fit: BoxFit.cover,
                                  //       ),
                                  //     ),
                                  //   )
                                  // :
                                  Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'asset/placeholderimage.webp'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
