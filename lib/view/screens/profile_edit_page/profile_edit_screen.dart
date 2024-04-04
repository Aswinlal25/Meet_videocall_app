// // ignore_for_file: deprecated_member_use

// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meet_up/models/auth/auth_functions.dart';
// import 'package:meet_up/view/Utile/colors.dart';
// import 'package:meet_up/view/Utile/constants.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final TextEditingController editednameController = TextEditingController();
//   final TextEditingController aboutContriller = TextEditingController();

//   @override
//   void initState() {
//     editednameController.text = userModel!.username;
//     aboutContriller.text = userModel?.about ?? 'write youerself';
//     super.initState();
//   }

//   XFile? _image;

//   Future<void> pickImage() async {
//     ImagePicker imagePicker = ImagePicker();
//     XFile? pickedImage =
//         await imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       setState(() {
//         _image = pickedImage;
//       });

//       // Upload image to Firebase Storage
//       await uploadImageToFirebaseStorage(File(_image!.path));
//     }
//   }

//   Future<void> uploadImageToFirebaseStorage(File imageFile) async {
//     try {
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child('profile_images')
//           .child(fileName);
//       firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
//       firebase_storage.TaskSnapshot snapshot = await uploadTask;
//       String downloadUrl = await snapshot.ref.getDownloadURL();

//       // Update the user's document in Firestore with the image URL
//       await updateUserProfileImage(downloadUrl);
//     } catch (error) {
//       print('Error uploading image: $error');
//     }
//   }

//   Future<void> updateUserProfileImage(String imageUrl) async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       String currentUserUid = user.uid;

//       // Update the user's profile image URL in Firestore
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUserUid)
//           .update({'image': imageUrl});
//       Navigator.pop(context, true);
//       Navigator.pop(context, true);

//       showCustomSnackbar(context, 'Profile image updated successfully!');
//       print('Profile image updated successfully!');
//     }
//   }

//   Future<void> updatedetails() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       String currentUserUid = user.uid;

//       // Update the user's profile image URL in Firestore
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUserUid)
//           .update({
//         //'image': imageUrl,
//         'username': editednameController.text,
//         'about': aboutContriller.text
//       });
//       showCustomSnackbar(context, 'Profile Details updated successfully!');
//       print('Profile Details updated successfully!');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: kblack,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: Stack(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   kheight10,
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       color: kgrey,
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                   kheight30,
//                   kheight5,
//                   Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         kheight20,
//                         kheight50,
//                         Text(
//                           '  Name',
//                           style: TextStyle(
//                             color: Colors.white38,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 17,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                         kheight5,
//                         Container(
//                           height: screenSize.height * 0.07,
//                           width: screenSize.width * 0.9,
//                           child: TextFormField(
//                             controller: editednameController,
//                             validator: (val) => val != null && val.isNotEmpty
//                                 ? null
//                                 : 'Required Field',
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20)),
//                                 borderSide: BorderSide(
//                                   color: Colors
//                                       .white30, // Border color in normal state
//                                   width: 2.0,
//                                 ),
//                               ),
//                               contentPadding:
//                                   EdgeInsets.all(screenSize.width * 0.05),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20)),
//                                 borderSide: BorderSide(
//                                   color: Colors
//                                       .amber, // Border color in focused state
//                                   width: 2.0,
//                                 ),
//                               ),
//                               hintText: 'Name',
//                               hintStyle: TextStyle(
//                                 color: Colors.white38,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         kheight10,
//                         Text(
//                           '  About',
//                           style: TextStyle(
//                             color: Colors.white38,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 17,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                         kheight5,
//                         Container(
//                           height: screenSize.height * 0.16,
//                           width: screenSize.width * 0.9,
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                               border:
//                                   Border.all(color: Colors.white30, width: 2)),
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 left: screenSize.width * 0.02,
//                                 top: screenSize.height * 0.005),
//                             child: TextFormField(
//                               controller: aboutContriller,
//                               keyboardType: TextInputType.multiline,
//                               maxLines: null,
//                               style: TextStyle(
//                                 color: kwhite,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w400,
//                                 letterSpacing: 1,
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: 'About',
//                                 hintStyle: TextStyle(
//                                   color: Colors.white38,
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 15,
//                                 ),
//                                 border: InputBorder.none,
//                                 contentPadding:
//                                     EdgeInsets.all(screenSize.width * 0.02),
//                               ),
//                               validator: (value) {
//                                 if (value == null) return null;
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//                         kheight30,
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               updatedetails().then((value) {
//                                 getUserDetails();
//                                 Navigator.pop(context, true);
//                                 Navigator.pop(context, true);

// ignore_for_file: deprecated_member_use

//                                 // Navigator.pop(context);
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               primary: kamber,
//                               elevation: 0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 side: BorderSide(color: kamber, width: 2),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: SizedBox(
//                                 height: screenSize.height * 0.035,
//                                 width: screenSize.width * 0.2,
//                                 child: Center(
//                                   child: Text(
//                                     'Save',
//                                     style: TextStyle(
//                                         fontSize: screenSize.width * 0.04,
//                                         color: kblack,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 top: 110,
//                 right: 140,
//                 child: InkWell(
//                   onDoubleTap: () {},
//                   onTap: () {
//                     pickImage();
//                   },
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       width: 180,
//                       height: 180,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         color: kamber,
//                       ),
//                       child: Center(
//                         child: Container(
//                           width: 175,
//                           height: 175,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: kblack,
//                           ),
//                           child: Center(
//                             child: Hero(
//                               tag: 'currentUserPicture',
//                               child: _image != null
//                                   ? Container(
//                                       width: 170,
//                                       height: 170,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         image: DecorationImage(
//                                           image: FileImage(File(_image!.path)),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     )
//                                   : userModel != null &&
//                                           userModel!.image != null &&
//                                           userModel!.image!.isNotEmpty
//                                       ? Container(
//                                           width: 170,
//                                           height: 170,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(25),
//                                             image: DecorationImage(
//                                               image: NetworkImage(
//                                                   userModel!.image!),
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         )
//                                       : Container(
//                                           width: 170,
//                                           height: 170,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(25),
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   'asset/placeholderimage.webp'),
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 20,
//                 left: 10,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     width: 43,
//                     height: 43,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: kblack,
//                     ),
//                     child: Icon(
//                       CupertinoIcons.back,
//                       color: fkwhite,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 130,
//                 left: 165,
//                 child: Transform.rotate(
//                   angle: -1.5708,
//                   child: Text(
//                     "Edit profile",
//                     style: TextStyle(
//                       fontSize: 60,
//                       color: Colors.white12,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meet_up/models/auth/auth_functions.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController editednameController = TextEditingController();
  final TextEditingController aboutContriller = TextEditingController();
  XFile? _image;
  bool _uploadingImage = false;

  @override
  void initState() {
    editednameController.text = userModel!.username;
    aboutContriller.text = userModel?.about ?? 'write yourself';
    super.initState();
  }

  Future<void> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
        _uploadingImage = true;
      });

      await uploadImageToFirebaseStorage(File(_image!.path));

      setState(() {
        _uploadingImage = false;
      });
    }
  }

  Future<void> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName);
      firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
      firebase_storage.TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      await updateUserProfileImage(downloadUrl);
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

  Future<void> updateUserProfileImage(String imageUrl) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String currentUserUid = user.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .update({'image': imageUrl});
      Navigator.pop(context, true);
      Navigator.pop(context, true);

      showCustomSnackbar(context, 'Image updated successfully!');
      print('Profile image updated successfully!');
    }
  }

  Future<void> updatedetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String currentUserUid = user.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .update({
        'username': editednameController.text,
        'about': aboutContriller.text
      });
      showCustomSnackbar(context, 'Details updated successfully!');
      print('Profile Details updated successfully!');
    }
  }

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
                    kheight10,
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: kgrey,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    kheight30,
                    kheight5,
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kheight20,
                          kheight50,
                          Text(
                            '  Name',
                            style: TextStyle(
                              color: Colors.white38,
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                              letterSpacing: 1,
                            ),
                          ),
                          kheight5,
                          Container(
                            height: screenSize.height * 0.07,
                            width: screenSize.width * 0.9,
                            child: TextFormField(
                              controller: editednameController,
                              validator: (val) => val != null && val.isNotEmpty
                                  ? null
                                  : 'Required Field',
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.white30,
                                    width: 2.0,
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.all(screenSize.width * 0.05),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
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
                          kheight10,
                          Text(
                            '  About',
                            style: TextStyle(
                              color: Colors.white38,
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                              letterSpacing: 1,
                            ),
                          ),
                          kheight5,
                          Container(
                            height: screenSize.height * 0.16,
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
                                controller: aboutContriller,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
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
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                updatedetails().then((value) {
                                  getUserDetails();
                                  Navigator.pop(context, true);
                                  Navigator.pop(context, true);
                                });
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
                                  width: screenSize.width * 0.2,
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 110,
                  right: 140,
                  child: InkWell(
                    onDoubleTap: () {},
                    onTap: () {
                      pickImage();
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
                                child: _uploadingImage
                                    ? CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: Colors.white54,
                                      )
                                    : _image != null
                                        ? Container(
                                            width: 170,
                                            height: 170,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              image: DecorationImage(
                                                image: FileImage(
                                                    File(_image!.path)),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : userModel != null &&
                                                userModel!.image != null &&
                                                userModel!.image!.isNotEmpty
                                            ? Container(
                                                width: 170,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        userModel!.image!),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: 170,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
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
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kblack,
                      ),
                      child: Icon(
                        CupertinoIcons.back,
                        color: fkwhite,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 165,
                  child: Transform.rotate(
                    angle: -1.5708,
                    child: Text(
                      "Edit profile",
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white12,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
