import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:meet_up/view/Utile/dialog_box/logout.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kblack,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          // bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                                'asset/Council Post_ What Are Chatbots, And How Can Home Service Providers Use Them_.jpeg'),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'M',
                                style: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                  letterSpacing: 4,
                                ),
                              ),
                              TextSpan(
                                text: 'E',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 35,
                                  letterSpacing: 4,
                                ),
                              ),
                              TextSpan(
                                text: 'ET',
                                style: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                  letterSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.doc_chart),
                    title: Text(
                      'Help',
                      style: TextStyle(
                          color: fkwhite,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.lock),
                    title: Text(
                      'Privacy policy',
                      style: TextStyle(
                          color: fkwhite,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.doc),
                    title: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                          color: fkwhite,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.info),
                    title: Text(
                      'About us',
                      style: TextStyle(
                          color: fkwhite,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.square_arrow_right),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.red,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return CustomDialog();
                          }));
                    },
                  ),
                  SizedBox(
                    height: 280,
                  ),
                ],
              ),
              Positioned(
                bottom: 60,
                left: 160,
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
