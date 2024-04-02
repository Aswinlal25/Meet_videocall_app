// // ignore_for_file: deprecated_member_use

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:meet_up/models/auth/auth_functions.dart';
// import 'package:meet_up/models/current_user_model.dart';
// import 'package:meet_up/view/Utile/colors.dart';
// import 'package:meet_up/view/Utile/constants.dart';
// import 'package:meet_up/view/Utile/dialog_box/logout.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final UserModel userModel = UserModel();

//   @override
//   void initState() {
//     getUserDetails();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: kblack,
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     width: 43,
//                     height: 43,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15), color: kgrey),
//                     child: Icon(
//                       CupertinoIcons.back,
//                       color: fkwhite,
//                     ),
//                   ),
//                 ),
//                 kheight20,
//                 // Align(
//                 //   alignment: Alignment.bottomCenter,
//                 //   child: Text(
//                 //     'Aswin Lal',
//                 //     style: TextStyle(
//                 //         color: kwhite,
//                 //         fontSize: 35,
//                 //         fontWeight: FontWeight.bold,
//                 //         letterSpacing: 1),
//                 //   ),
//                 // ),
//                 kheight50,
//                 kheight50,
//                 kheight20,
//                 Container(
//                   width: double.infinity,
//                   height: 470,
//                   decoration: BoxDecoration(
//                       color: kgrey,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                           bottomRight: Radius.circular(20))),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         kheight50,
//                         kheight50,
//                         Text(
//                           'Name',
//                           style: TextStyle(
//                               color: Colors.white38,
//                               fontWeight: FontWeight.w300,
//                               fontSize: 17,
//                               letterSpacing: 1),
//                         ),
//                         Text(
//                           '${userModel.displayName}',
//                           style: TextStyle(
//                               color: Colors.white70,
//                               fontWeight: FontWeight.w700,
//                               fontSize: 29,
//                               letterSpacing: 1),
//                         ),
//                         kheight20,
//                         Text(
//                           'Email',
//                           style: TextStyle(
//                               color: Colors.white38,
//                               fontWeight: FontWeight.w300,
//                               fontSize: 17,
//                               letterSpacing: 1),
//                         ),
//                         Text(
//                           '${userModel.email}',
//                           style: TextStyle(
//                               color: Colors.white70,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15,
//                               letterSpacing: 1),
//                         ),
//                         kheight20,
//                         Text(
//                           'Meet : Where Every Moment Matters. Elevate your connections with crystal-clear video calls and seamless interactions. Join the conversation, share experiences, and explore the power of real-time communication, anytime, anywhere.',
//                           style: TextStyle(
//                               color: Colors.white38,
//                               fontWeight: FontWeight.w300,
//                               fontSize: 17,
//                               letterSpacing: 1),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       width: 220,
//                       height: 70,
//                       decoration: BoxDecoration(
//                           color: kgrey,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(20),
//                               bottomRight: Radius.circular(20))),
//                     ),
//                     Container(
//                       width: 140,
//                       height: 70,
//                       decoration: BoxDecoration(
//                           color: kgrey,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(20),
//                               bottomRight: Radius.circular(20))),
//                       child: Container(
//                         width: 130,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             color: kblack,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(20),
//                                 bottomRight: Radius.circular(20))),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             top: 80,
//             left: 260,
//             child: Transform.rotate(
//               angle: -1.5708,
//               child: Text(
//                 "Meet",
//                 style: TextStyle(
//                   fontSize: 70,
//                   color: Colors.white12,
//                   letterSpacing: 2,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 110,
//             left: 55,
//             child: Container(
//               width: 180,
//               height: 180,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25), color: kamber),
//               child: Center(
//                 child: Container(
//                   width: 175,
//                   height: 175,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25), color: kblack),
//                   child: Center(
//                     child: Container(
//                       width: 170,
//                       height: 170,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           image: DecorationImage(
//                               image: AssetImage(
//                                   'asset/photo_2024-02-08_21-20-18.jpg'),
//                               fit: BoxFit.cover)),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//               bottom: 80,
//               right: 20,
//               child: ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: ((context) {
//                         return CustomDialog();
//                       }));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.transparent,
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     side: BorderSide(color: kamber, width: 2),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: SizedBox(
//                     height: screenSize.height * 0.035,
//                     width: screenSize.width * 0.15,
//                     child: Center(
//                       child: Text(
//                         'Logout',
//                         style: TextStyle(
//                           fontSize: screenSize.width * 0.04,
//                           color: fkwhite,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//           // Positioned(
//           //     top: 240,
//           //     left: 185,
//           //     child: CircleAvatar(
//           //       backgroundColor: kgrey,
//           //       child: Icon(
//           //         CupertinoIcons.pen,
//           //         color: fkwhite,
//           //       ),
//           //     ))
//           // Positioned(
//           //   top: 240,
//           //   left: 45,
//           //   child: ElevatedButton(
//           //     onPressed: () {},
//           //     style: ElevatedButton.styleFrom(
//           //       primary: Colors.transparent,
//           //       elevation: 0,
//           //       shape: RoundedRectangleBorder(
//           //         borderRadius: BorderRadius.circular(50.0),
//           //         side: BorderSide(color: kamber),
//           //       ),
//           //     ),
//           //     child: Padding(
//           //       padding: const EdgeInsets.all(10.0),
//           //       child: SizedBox(
//           //         height: screenSize.height * 0.035,
//           //         width: screenSize.width * 0.25,
//           //         child: Center(
//           //           child: Text(
//           //             'Edit Profile',
//           //             style: TextStyle(
//           //               fontSize: screenSize.width * 0.04,
//           //               color: kwhite,
//           //               fontWeight: FontWeight.bold,
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/models/current_user_model.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet_up/view/Utile/dialog_box/logout.dart';
import 'package:meet_up/view/Utile/photoview_page/image_view.dart';
import 'package:meet_up/view/screens/profile_edit_page/profile_edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String image;
  final String about;

  const ProfileScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.image,
    required this.about,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  void getUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String currentUserUid = user.uid;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserUid)
          .get();

      if (userDoc.exists) {
        setState(() {
          userModel = UserModel.fromJson(
            userDoc.id,
            userDoc.data() as Map<String, dynamic>,
          );
        });
        print("==============${userModel?.username.toString()}");
      } else {
        print("Document not found for current user.");
      }
    } else {
      print('No user signed in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kblack,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
            child: Column(
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
                kheight20,
                kheight50,
                kheight50,
                kheight20,
                Container(
                  width: double.infinity,
                  height: 470,
                  decoration: BoxDecoration(
                    color: kgrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight50,
                        kheight50,
                        Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          widget.name,
                          //'${userModel?.username}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 29,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          widget.about,
                          //'${userModel?.username}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 1,
                          ),
                        ),
                        kheight20,
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          widget.email,
                          // '${userModel?.email}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            letterSpacing: 1,
                          ),
                        ),
                        kheight20,
                        Text(
                          'Meet : Where Every Moment Matters. Elevate your connections with crystal-clear video calls and seamless interactions. Join the conversation, share experiences, and explore the power of real-time communication, anytime, anywhere.',
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 220,
                      height: 70,
                      decoration: BoxDecoration(
                        color: kgrey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 70,
                      decoration: BoxDecoration(
                        color: kgrey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        width: 130,
                        height: 70,
                        decoration: BoxDecoration(
                          color: kblack,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 80,
            left: 260,
            child: Transform.rotate(
              angle: -1.5708,
              child: Text(
                "Meet",
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.white12,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 55,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ImageView(userimage: widget.image)));
              },
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
                        child: userModel != null &&
                                userModel!.image != null &&
                                userModel!.image!.isNotEmpty
                            ? Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: NetworkImage(widget.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
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
          Positioned(
            bottom: 80,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return CustomDialog();
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
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
                  width: screenSize.width * 0.15,
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04,
                        color: fkwhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 23,
              top: 231,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => EditProfileScreen()),
                  ).then((value) {
                    if (value != null && value == true) {
                      // Fetch updated user details
                      getUserDetails();
                    }
                  });
                },
                child: CircleAvatar(
                  backgroundColor: kblack,
                  child: Icon(
                    CupertinoIcons.pen,
                    color: kamber,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
