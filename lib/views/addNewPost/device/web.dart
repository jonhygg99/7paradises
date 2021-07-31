import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/icons.dart';
import 'package:seven_paradises/model/facebook/facebook.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/widgets/bubbleButtonPost.dart';

class WebAddNewPostScreen extends StatelessWidget {
  final Facebook facebook;
  final bool loaderFB;
  final Function initFBPicker;
  WebAddNewPostScreen({
    @required this.facebook,
    @required this.loaderFB,
    @required this.initFBPicker,
  });

  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: Container(
        height: MediaQuery.of(context).size.height - 80.0 - 50.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonDesign(isDark: true),
                const SizedBox(height: 20),
                getTitle('Upload a new post'),
              ],
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
                loaderFB
                    ? CircularProgressIndicator()
                    : BubbleButtonPost(
                        icon: kFacebookDark,
                        title: 'Facebook',
                        action: initFBPicker,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
