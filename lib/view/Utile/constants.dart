import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up/view/Utile/colors.dart';

const SizedBox kheight5 = SizedBox(
  height: 5,
);
const SizedBox kheight10 = SizedBox(
  height: 10,
);
const SizedBox kheight15 = SizedBox(
  height: 15,
);
const SizedBox kheight20 = SizedBox(
  height: 20,
);
const SizedBox kheight30 = SizedBox(
  height: 30,
);
const SizedBox kheight50 = SizedBox(height: 50);

const SizedBox kwith10 = SizedBox(
  width: 10,
);
const SizedBox kwith5 = SizedBox(
  width: 5,
);

void showCustomSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kgrey,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(CupertinoIcons.check_mark, color: kgreen),
            SizedBox(width: 10),
            Text(
              message,
              style: TextStyle(color: kwhite),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 2), // Adjust the duration as needed
    ),
  );
}
