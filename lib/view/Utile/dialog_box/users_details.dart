import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/view/Utile/colors.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class OtherUsersDialog extends StatefulWidget {
  final String? id;
  final String? image;
  final String? username;
  final String? about;
  const OtherUsersDialog(
      {Key? key, required this.image, this.username, this.about, this.id})
      : super(key: key);

  @override
  State<OtherUsersDialog> createState() => _OtherUsersDialogState();
}

class _OtherUsersDialogState extends State<OtherUsersDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kblack,
      child: Container(
        width: 380,
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
                    tag: 'photo',
                    child: Container(
                      height: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.image!),
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black,
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.4),
                              Colors.transparent,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 30,
                  child: Center(
                    child: Text(
                      widget.username!,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 4,
                          fontSize: 35,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                // Positioned(
                //     top: 20,
                //     left: 30,
                //     child: Container(
                //       width: 150, // Adjust width as needed
                //       height: 50, // Adjust height as needed
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(15.0),
                //         border: Border.all(color: kamber, width: 3),
                //       ),
                //     )),
                Positioned(
                  bottom: 100,
                  left: 30,
                  child: Container(
                    width: 250,
                    child: Text(
                      widget.about!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
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
                  bottom: 10,
                  left: 40,
                  child: Container(
                    height: 90,
                    width: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 110, width: 50, child: actionButton(false)),
                        Container(
                            height: 110, width: 50, child: actionButton(true)),
                        // CircleAvatar(
                        //   backgroundColor: kgrey,
                        //   radius: 30,
                        //   child: Center(
                        //     child: Icon(CupertinoIcons.video_camera_solid,
                        //         color: kred),
                        //   ),
                        // ),
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

  ZegoSendCallInvitationButton actionButton(bool isVideo) =>
      ZegoSendCallInvitationButton(
          invitees: [ZegoUIKitUser(id: widget.id!, name: widget.username!)],
          resourceID: 'Meet_call',
          isVideoCall: isVideo);
}
//  Positioned(
//                   top: 150,
//                   left: 10,
//                   child: RotatedBox(
//                     quarterTurns: 3,
//                     child: Center(
//                       child: Text(
//                         widget.username!,
//                         style: TextStyle(
//                             color: Colors.white,
//                             letterSpacing: 4,
//                             fontSize: 35,
//                             fontWeight: FontWeight.w300),
//                       ),
//                     ),
//                   ),
//                 ),