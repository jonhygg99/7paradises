import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class BubbleButtonPost extends StatelessWidget {
  BubbleButtonPost(
      {@required this.icon, @required this.title, @required this.action});
  final Widget icon;
  final String title;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              onPressed: action,
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.all(0),
                  primary: kWhite),
              child: icon,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
