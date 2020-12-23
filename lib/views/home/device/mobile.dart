import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/mobile_layout.dart';

import '../greetings_message.dart';
import '../image_feed.dart';
import '../search_field.dart';

class MobileHomeScreen extends StatelessWidget {
  MobileHomeScreen({this.textController});
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.Home,
      view: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          GreetingsMessage(username: 'Emily'),
          SearchField(textController: textController),
          const SizedBox(height: 20.0),
          ImageFeed(),
        ],
      ),
    );
  }
}
