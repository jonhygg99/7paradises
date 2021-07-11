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
  bool isEmpty = true;
  bool isLiked = false;
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebPlaceScreen(
          textController: textController,
          id: widget.id,
          isEmpty: isEmpty,
          isLiked: isLiked,
          toggleIsEmpty: toggleIsEmpty,
          toggleIsLike: toggleIsLike,
        ),
        mobile: MobilePlaceScreen(
          textController: textController,
          id: widget.id,
          isEmpty: isEmpty,
          isLiked: isLiked,
          toggleIsEmpty: toggleIsEmpty,
          toggleIsLike: toggleIsLike,
        ),
      ),
    );
  }

  void toggleIsEmpty(value) {
    setState(() {
      if (value.isEmpty)
        isEmpty = true;
      else if (value.isNotEmpty && isEmpty) isEmpty = false;
    });
  }

  void toggleIsLike() {
    setState(() => isLiked = !isLiked);
  }
}
