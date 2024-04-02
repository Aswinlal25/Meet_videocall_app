// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/models/auth/auth_functions.dart';
import 'package:meet_up/models/current_user_model.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/constants.dart';
import 'package:meet_up/view/Utile/custom_drawer/drawer.dart';
import 'package:meet_up/view/Utile/dialog_box/users_details.dart';
import 'package:meet_up/view/screens/profile_screen/profile_screen.dart';
import 'package:meet_up/view/screens/user_create_screen/user_create_screen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AuthApi authApi = AuthApi();
  bool isSearchCClicked = false;
  List<UserModel> allUsers = [];
  List<UserModel> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
    getUserDetails();
    onUserLogin();
  }

  void onUserLogin() {
    if (userModel != null) {
      ZegoUIKitPrebuiltCallInvitationService().init(
        appID: 687637959,
        appSign:
            "f03e62d0c1d7469ddb2211b4b44a3143199e5dfa18b6c16f3907800182feeecd",
        userID: userModel!.id,
        userName: userModel!.username,
        plugins: [ZegoUIKitSignalingPlugin()],
      );
    }
  }

  void fetchUsers() async {
    List<UserModel> fetchedUsers = await getAllUsers();
    setState(() {
      // Filter out the current user from the fetched users
      allUsers =
          fetchedUsers.where((user) => user.id != userModel?.id).toList();
      filteredUsers = allUsers; // Initialize filteredUsers with allUsers
    });
  }

  void filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the query is empty, show all users
        filteredUsers = allUsers;
      } else {
        // Otherwise, filter users whose username contains the query
        filteredUsers = allUsers
            .where((user) =>
                user.username.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
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
                  color: kgrey,
                ),
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
                          image: AssetImage('asset/icons/main-menu.png'),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => UserCreateScreen()));
                        },
                        child: Text(
                          "Meet",
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w400,
                            color: Colors.white12,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      Spacer(),
                      kwith10,
                      kwith10,
                      kwith10,
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
                                color: isSearchCClicked ? kamber : Colors.grey,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
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
                                about: userModel!.about!,
                              ),
                            ),
                          ).then((value) {
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
                            color: kamber,
                          ),
                          child: Center(
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kblack,
                              ),
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
                                              image: userModel!.image != null &&
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
                      SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            ),
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
                                fontSize: 14,
                              ),
                              suffixIcon: Icon(
                                CupertinoIcons.search,
                                color: Colors.white30,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              filterUsers(value); // Call filterUsers on change
                            },
                          ),
                        )
                      : SizedBox(),
                  Container(
                    width: double.infinity,
                    height: screenSize.height * 0.83,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 0.80,
                      ),
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        UserModel user = filteredUsers[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return OtherUsersDialog(
                                    image: user.image,
                                    username: user.username,
                                    about: user.about ?? '',
                                    id: user.id,
                                  );
                                },
                              );
                            },
                            child: Hero(
                              tag: 'image$index',
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(user.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: kgrey,
                                            radius: 23,
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.phone_fill,
                                                color: kgreen,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
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
                                        user.username,
                                        style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 2.5,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      kheight5,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
