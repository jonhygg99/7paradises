import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';

class WebPlaceScreen extends StatelessWidget {
  final TextEditingController textController;
  final String id;
  WebPlaceScreen({this.textController, this.id});
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.None,
      view: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
