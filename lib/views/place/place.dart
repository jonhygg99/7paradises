import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'device/mobile.dart';
import 'device/web.dart';

class PlaceScreen extends StatefulWidget {
  final String id;
  PlaceScreen(this.id);
  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebPlaceScreen(textController: textController, id: widget.id),
        mobile:
            MobilePlaceScreen(textController: textController, id: widget.id),
      ),
    );
  }
}
