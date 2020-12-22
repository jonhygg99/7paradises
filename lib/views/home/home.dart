import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/views/home/device/mobile.dart';
import 'package:seven_paradises/views/home/device/web.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebHomeScreen(textController: textController),
        mobile: MobileHomeScreen(textController: textController),
      ),
    );
  }
}
