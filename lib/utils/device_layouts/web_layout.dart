import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/config/application.dart';
import 'package:seven_paradises/config/routes.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/measures.dart';

import '../floating_bottom_navigation_bar.dart';
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
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == NavigationBarState.Home)
      Application.router
          .navigateTo(context, Routes.home, transition: TransitionType.none);
    else if (index == NavigationBarState.Favourite)
      Application.router.navigateTo(context, Routes.favourite,
          transition: TransitionType.none);
    else
      Application.router
          .navigateTo(context, Routes.profile, transition: TransitionType.none);
  }
}
