import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'device/mobile.dart';
import 'device/web.dart';

class AddNewPostScreen extends StatefulWidget {
  @override
  _AddNewPostScreenState createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebAddNewPostScreen(),
        mobile: MobileAddNewPostScreen(),
      ),
    );
  }
}
