import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';

class WebProfileScreen extends StatelessWidget {
  final bool value;
  final Function toggle;
  WebProfileScreen({this.toggle, @required this.value});
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.Home,
      view: Column(
        children: [],
      ),
    );
  }
}
