import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/icons.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';

class MobileAddNewPostScreen extends StatelessWidget {
  MobileAddNewPostScreen();
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonDesign(isDark: true),
                const SizedBox(height: 20),
                getTitle('Upload a new post'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BubbleButtonPost(icon: Icon(Icons.camera_alt), title: 'Gallery'),
              BubbleButtonPost(icon: kInstagramDark, title: 'Instagram'),
              BubbleButtonPost(icon: kFacebookDark, title: 'Facebook'),
              const SizedBox(height: 130)
            ],
          ),
        ],
      ),
    );
  }
}

class BubbleButtonPost extends StatelessWidget {
  BubbleButtonPost({@required this.icon, @required this.title});
  final Widget icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.all(0),
              color: kWhite,
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
