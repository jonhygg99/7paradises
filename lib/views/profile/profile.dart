import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'device/mobile.dart';
import 'device/web.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebProfileScreen(value: value, toggle: toggleValue),
        mobile: MobileProfileScreen(value: value, toggle: toggleValue),
      ),
    );
  }

  void toggleValue() {
    setState(() {
      value = !value;
    });
  }
}
