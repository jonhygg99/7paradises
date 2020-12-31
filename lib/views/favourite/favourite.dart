import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'device/mobile.dart';
import 'device/web.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebFavouriteScreen(value: value, toggle: toggleValue),
        mobile: MobileFavouriteScreen(value: value, toggle: toggleValue),
      ),
    );
  }

  void toggleValue() {
    setState(() {
      value = !value;
    });
  }
}
