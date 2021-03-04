import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';

class MobileAlbumGrid extends StatefulWidget {
  MobileAlbumGrid();

  @override
  _MobileAlbumGridState createState() => _MobileAlbumGridState();
}

class _MobileAlbumGridState extends State<MobileAlbumGrid> {
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: Center(
        child: Text('Album Grid'),
      ),
    );
  }
}
