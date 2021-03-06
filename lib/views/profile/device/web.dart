import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';
import 'package:seven_paradises/utils/tab_bar/new_tab_bar_view.dart';
import 'package:seven_paradises/views/profile/widgets/social_media_bubbles.dart';

class WebProfileScreen extends StatelessWidget {
  final bool value;
  final Function toggle;
  WebProfileScreen({this.toggle, @required this.value});
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.Profile,
      view: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1608161317468-535e91d1fa9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Emily Harmon',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              Text(
                'It\'s the not the destination, it\'s the journey',
                style: TextStyle(color: kGrey),
              ),
              const SizedBox(height: 20.0),
              SocialMediaBubbles(),
              const SizedBox(height: 20.0),
              NewTabBarView(
                value: value,
                toggle: toggle,
                tabBarNames: ['Gallery', 'Liked'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
