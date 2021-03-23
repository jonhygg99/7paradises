import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';

import '../floatingAddNewPost.dart';
import '../floating_bottom_navigation_bar.dart';
import 'navigation.dart';
import 'settings_app_bar.dart';

class MobileLayout extends StatelessWidget {
  final int state;
  final Widget view;
  final bool isBottomNavigation;
  final Widget bottomSheet;
  MobileLayout(
      {@required this.state,
      @required this.view,
      this.isBottomNavigation = true,
      this.bottomSheet});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: state == NavigationBarState.Profile ? settingsAppBar() : null,
        backgroundColor: kLightWhite,
        body: Align(alignment: Alignment.topCenter, child: view),
        floatingActionButton:
            state == NavigationBarState.Profile ? FloatingAddNewPost() : null,
        extendBody: true,
        bottomSheet: bottomSheet,
        bottomNavigationBar: isBottomNavigation
            ? FloatingBottomNavigationBar(
                state: state,
                navigateTo: navigateTo,
              )
            : null,
      ),
    );
  }
}
