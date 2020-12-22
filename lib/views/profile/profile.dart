import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/mobile_layout.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MobileLayout(
        state: NavigationBarState.Profile,
        view: Center(
          child: Text('Profile'),
        ),
      ),
    );
  }
}
