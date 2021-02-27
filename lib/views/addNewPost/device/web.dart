import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';

class WebAddNewPostScreen extends StatelessWidget {
  WebAddNewPostScreen();
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.None,
      view: Column(
        children: [Text('data')],
      ),
    );
  }
}
