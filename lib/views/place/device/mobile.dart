import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/views/place/widgets/top_view.dart';

class MobilePlaceScreen extends StatelessWidget {
  final TextEditingController textController;
  final String id;
  MobilePlaceScreen({this.textController, this.id});
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.None,
      view: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [TopView(id), Text('Hello')],
      ),
    );
  }
}
