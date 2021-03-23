import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';

class WebAlbumGrid extends StatelessWidget {
  WebAlbumGrid();
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.None,
      view: Center(
        child: Text('Album Grid'),
      ),
    );
  }
}
