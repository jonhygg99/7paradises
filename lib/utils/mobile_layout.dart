import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/config/application.dart';
import 'package:seven_paradises/config/routes.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';

import 'floating_bottom_navigation_bar.dart';

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
        backgroundColor: kLightWhite,
        body: Align(alignment: Alignment.topCenter, child: widget.view),
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
