import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/mobileLayout.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MobileLayout(
        refreshPage: () {},
        state: NavigationBarState.Profile,
        view: Center(
          child: Text('Profile'),
        ),
      ),
    );
  }
}
