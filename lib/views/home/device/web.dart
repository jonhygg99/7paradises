import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/web_layout.dart';

import '../image_feed.dart';
import '../search_field.dart';

class WebHomeScreen extends StatelessWidget {
  WebHomeScreen({this.textController});
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.Home,
      view: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SearchField(textController: textController),
            const SizedBox(height: 20.0),
            ImageFeed(),
          ],
        ),
      ),
    );
  }
}
