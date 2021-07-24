import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/measures.dart';

import '../floatingAddNewPost.dart';
import '../floating_bottom_navigation_bar.dart';
import 'navigation.dart';
import 'settings_app_bar.dart';

class WebLayout extends StatelessWidget {
  final int state;
  final Widget view;
  final bool isBottomNavigation;
  final bool isTopPadding;
  WebLayout({
    @required this.state,
    @required this.view,
    this.isBottomNavigation = true,
    this.isTopPadding = true
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: state == NavigationBarState.Profile ? settingsAppBar() : null,
        backgroundColor: kLightWhite,
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
              left: kDefaultWebPaddingHorizontal,
              right: kDefaultWebPaddingHorizontal,
              top: isTopPadding ? kDefaultWebPaddingTop : 0.0,
            ),
            child: SingleChildScrollView(child: view),
          ),
        ),
        floatingActionButton:
            state == NavigationBarState.Profile ? FloatingAddNewPost() : null,
        extendBody: true,
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
