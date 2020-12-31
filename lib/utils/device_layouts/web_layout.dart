import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/measures.dart';

import '../floating_bottom_navigation_bar.dart';
import 'navigation.dart';
import 'settings_app_bar.dart';

class WebLayout extends StatefulWidget {
  WebLayout({@required this.state, @required this.view});
  final int state;
  final Widget view;

  @override
  _WebLayoutState createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.state == NavigationBarState.Profile
            ? settingsAppBar()
            : null,
        backgroundColor: kLightWhite,
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
                left: kDefaultWebPadding, right: kDefaultWebPadding),
            child: ListView(
              children: [
                const SizedBox(height: 80.0),
                widget.view,
              ],
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: FloatingBottomNavigationBar(
          state: widget.state,
          navigateTo: navigateTo,
        ),
      ),
    );
  }
}
