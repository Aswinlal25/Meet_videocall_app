import 'package:flutter/material.dart';
import 'package:meet_up/view/Utile/colors.dart';

class ImageView extends StatefulWidget {
  final String? userimage;
  const ImageView({super.key, required this.userimage});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: InkWell(
        onDoubleTap: () {
          Navigator.pop(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                height: 600,
                child: Hero(
                  tag: 'currentUserPicture',
                  child: Image(
                    image: NetworkImage(widget.userimage!),
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
