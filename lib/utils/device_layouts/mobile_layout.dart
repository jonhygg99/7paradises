import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';

import '../floating_bottom_navigation_bar.dart';
import 'navigation.dart';
import 'settings_app_bar.dart';

class MobileLayout extends StatefulWidget {
  MobileLayout({@required this.state, @required this.view});
  final int state;
  final Widget view;

  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.state == NavigationBarState.Profile
            ? settingsAppBar()
            : null,
        backgroundColor: kLightWhite,
        body: Align(alignment: Alignment.topCenter, child: widget.view),
        extendBody: true,
        bottomNavigationBar: FloatingBottomNavigationBar(
          state: widget.state,
          navigateTo: navigateTo,
        ),
      ),
    );
  }
}