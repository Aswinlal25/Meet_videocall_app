// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/models/auth/auth_functions.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';
import 'package:meet_up/view/Utile/custom_drawer/drawer.dart';
import 'package:meet_up/view/Utile/dialog_box/users_details.dart';
import 'package:meet_up/view/screens/profile_screen/profile_screen.dart';

String? username;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AuthApi authApi = AuthApi();
  bool isSearchCClicked = false;

  @override
  void initState() {
    super.initState();
    getUserDetails();
    //getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: null,
      backgroundColor: kblack,
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: kgrey),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 28),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Image(
                            width: 30,
                            image: AssetImage('asset/icons/main-menu.png')),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // RichText(
                      //   text: TextSpan(
                      //     children: [
                      // WidgetSpan(
                      //   child: Transform.rotate(
                      //     angle: -0.785398,
                      //     child: Text(
                      //       'M',
                      //       style: TextStyle(
                      //         color: kwhite,
                      //         fontWeight: FontWeight.w800,
                      //         fontSize: 20,
                      //         letterSpacing: 4,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // TextSpan(
                      //   text: 'M',
                      //   style: TextStyle(
                      //     color: fkwhite,
                      //     fontWeight: FontWeight.w800,
                      //     fontSize: 20,
                      //     letterSpacing: 4,
                      //   ),
                      // ),
                      // TextSpan(
                      //   text: 'e',
                      //   style: TextStyle(
                      //     color: Colors.yellow,
                      //     fontWeight: FontWeight.w800,
                      //     fontSize: 25,
                      //     letterSpacing: 4,
                      //   ),
                      // ),
                      // TextSpan(
                      //   text: 'et',
                      //   style: TextStyle(
                      //     color: kwhite,
                      //     fontWeight: FontWeight.w800,
                      //     fontSize: 20,
                      //     letterSpacing: 4,
                      //   ),
                      // ),
                      Text(
                        "Meet",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                          color: Colors.white30,
                          letterSpacing: 2,
                        ),
                      ),
                      //     ],
                      //   ),
                      // ),
                      Spacer(),
                      kwith10, kwith10, kwith10,
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSearchCClicked = !isSearchCClicked;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 39, 39, 39),
                          ),
                          child: Center(
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  color:
                                      isSearchCClicked ? kamber : Colors.grey,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProfileScreen(
                                        name: userModel!.username,
                                        email: userModel!.email,
                                        image: userModel!.image!,
                                      ))).then((value) {
                            setState(() {
                              getUserDetails();
                            });
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kamber),
                          child: Center(
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kblack),
                              child: Center(
                                child: Hero(
                                    tag: 'currentUserPicture',
                                    child: userModel != null &&
                                            userModel!.image != null &&
                                            userModel!.image!.isNotEmpty
                                        ? Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: userModel!.image !=
                                                            null &&
                                                        userModel!
                                                            .image!.isNotEmpty
                                                    ? NetworkImage(
                                                        userModel!.image!)
                                                    : NetworkImage(
                                                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fvideos%2Fanimation-and-motion-graphics&psig=AOvVaw12wfdhn57o4AqscfIBEhyv&ust=1711826596764000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOC63ZaZmoUDFQAAAAAdAAAAABAJ'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'asset/placeholderimage.webp'),
                                                    fit: BoxFit.cover)),
                                          )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            // kheight50,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  isSearchCClicked
                      ? Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kdark,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: '  Search...',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14),
                              suffixIcon: Icon(CupertinoIcons.search,
                                  color: Colors.white30),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide.none, // Remove border color
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .amber), // Change border color when focused
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        )
                      : SizedBox(),
                  // Container(
                  //   height: screenSize.height * 0.07,
                  //   width: screenSize.width * 0.9,
                  //   child: TextFormField(
                  //     obscureText: true,
                  //     validator: (val) =>
                  //         val != null && val.isNotEmpty ? null : 'Required Field',
                  //     decoration: const InputDecoration(
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(40)),
                  //           borderSide: BorderSide(
                  //             color: Colors.white30,
                  //             width: 2.0,
                  //           ),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(40)),
                  //           borderSide: BorderSide(
                  //             color: Colors.white,
                  //             width: 2.0,
                  //           ),
                  //         ),
                  //         hintText: 'User id',
                  //         hintStyle: TextStyle(
                  //           color: Colors.white60,
                  //           letterSpacing: 2,
                  //           fontSize: 15,
                  //         ),
                  //         prefixIcon: Icon(
                  //           Icons.person,
                  //           color: Colors.white60,
                  //           size: 20,
                  //         )),
                  //     style: const TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  // kheight20,
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     primary: kamber,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(50.0),
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: SizedBox(
                  //       height: screenSize.height * 0.035,
                  //       width: screenSize.width * 0.19,
                  //       child: Center(
                  //         child: Text(
                  //           'Continue',
                  //           style: TextStyle(
                  //               fontSize: screenSize.width * 0.04,
                  //               color: kblack,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: double.infinity,
                    height: screenSize.height * 0.83,
                    // color: kamber,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 0.80,
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext) {
                                    return OtherUsersDialog(
                                      image: null,
                                    );
                                  });
                            },
                            child: Hero(
                              tag: 'image$index',
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage('asset/parathy1.jpg'),
                                        fit: BoxFit.cover)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(0.7),
                                        Colors.black.withOpacity(0.4),
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //kwith5,
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       // color: kgrey,
                                      //       borderRadius: BorderRadius.only(
                                      //           bottomRight: Radius.circular(10),
                                      //           topRight: Radius.circular(10))),
                                      //   width: 30,
                                      //   height: screenSize.height * 0.22,
                                      //   child: RotatedBox(
                                      //     quarterTurns: 3,
                                      //     child: Center(
                                      //       child: Text(
                                      //         'Parvathy',
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             letterSpacing: 2.5,
                                      //             fontSize: 15,
                                      //             fontWeight: FontWeight.bold),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      Column(
                                        children: [
                                          Container(
                                            height: screenSize.height * 0.15,
                                          ),
                                          Row(
                                            children: [
                                              // kwith10,
                                              // kwith10,
                                              // kwith10,
                                              CircleAvatar(
                                                backgroundColor: kgrey,
                                                radius: 23,
                                                child: Center(
                                                  child: Icon(
                                                      CupertinoIcons.phone_fill,
                                                      color: kgreen),
                                                ),
                                              ),
                                              kwith10,
                                              kwith10,

                                              CircleAvatar(
                                                backgroundColor: kgrey,
                                                radius: 23,
                                                child: Center(
                                                  child: Icon(
                                                    CupertinoIcons
                                                        .video_camera_solid,
                                                    color: kred,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          kheight10,
                                          Text(
                                            'Parvathy',
                                            style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 2.5,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: Actions(actions: {}, child: Text('')),
    );
  }
}
//  parwez musharrraff b 
    //  text 
    //  center 
    //   sized box 
    //   padding 
    //   elevatio button 
     