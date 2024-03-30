import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/view/Utile/colors.dart';

class OtherUsersDialog extends StatefulWidget {
  const OtherUsersDialog({Key? key, required image}) : super(key: key);

  @override
  State<OtherUsersDialog> createState() => _OtherUsersDialogState();
}

class _OtherUsersDialogState extends State<OtherUsersDialog> {
  String? image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kblack,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kdark,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: 'image',
                    child: Container(
                      height: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'asset/parathy1.jpg',
                              ))),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 10,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Center(
                      child: Text(
                        'Parvathy',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 4,
                            fontSize: 35,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: Icon(
                          CupertinoIcons.clear,
                          color: fkwhite,
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 20,
                  left: 40,
                  child: Container(
                    height: 80,
                    width: 230,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: kgrey,
                          radius: 30,
                          child: Center(
                            child:
                                Icon(CupertinoIcons.phone_fill, color: kgreen),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: kgrey,
                          radius: 30,
                          child: Center(
                            child: Icon(CupertinoIcons.video_camera_solid,
                                color: kred),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
