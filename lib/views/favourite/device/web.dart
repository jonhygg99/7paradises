import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';
import 'package:seven_paradises/utils/tab_bar/new_tab_bar_view.dart';

class WebFavouriteScreen extends StatelessWidget {
  final bool value;
  final Function toggle;
  WebFavouriteScreen({this.toggle, @required this.value});
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.Favourite,
      view: Align(
        alignment: Alignment.topCenter,
        child: NewTabBarView(
          value: value,
          toggle: toggle,
          tabBarNames: ['Saved', 'Collections'],
        ),
      ),
    );
  }
}
