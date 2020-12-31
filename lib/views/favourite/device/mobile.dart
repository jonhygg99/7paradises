import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/utils/tab_bar/new_tab_bar_view.dart';

class MobileFavouriteScreen extends StatelessWidget {
  final bool value;
  final Function toggle;
  MobileFavouriteScreen({this.toggle, @required this.value});
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.Favourite,
      view: ListView(
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Favourites',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
          ),
          const SizedBox(height: 20.0),
          NewTabBarView(
            value: value,
            toggle: toggle,
            tabBarNames: ['Saved', 'Collections'],
          ),
        ],
      ),
    );
  }
}
