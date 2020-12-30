import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MobileLayout(
        state: NavigationBarState.Favourite,
        view: Center(
          child: Text('Favourite'),
        ),
      ),
    );
  }
}
