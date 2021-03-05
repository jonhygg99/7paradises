import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/icons.dart';
import 'package:seven_paradises/model/facebook/facebook.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/widgets/bubbleButtonPost.dart';

class MobileAddNewPostScreen extends StatelessWidget {
  final Facebook facebook;
  final bool isCheckingFB;
  final Function initFBPicker;
  MobileAddNewPostScreen({
    @required this.facebook,
    @required this.isCheckingFB,
    @required this.initFBPicker,
  });
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
              BubbleButtonPost(
                icon: kGalleryIcon,
                title: 'Gallery',
                action: () {},
              ),
              BubbleButtonPost(
                icon: kInstagramDark,
                title: 'Instagram',
                action: () {},
              ),
              isCheckingFB
                  ? CircularProgressIndicator()
                  : BubbleButtonPost(
                      icon: kFacebookDark,
                      title: 'Facebook',
                      action: initFBPicker,
                    ),
              const SizedBox(height: 130)
            ],
          ),
        ],
      ),
    );
  }
}
