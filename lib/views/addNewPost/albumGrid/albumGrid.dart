import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'device/mobile.dart';
import 'device/web.dart';

class AlbumGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebAlbumGrid(),
        mobile: MobileAlbumGrid(),
      ),
    );
  }
}
