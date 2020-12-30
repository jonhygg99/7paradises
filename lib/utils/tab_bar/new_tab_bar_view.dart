import 'package:flutter/material.dart';
import 'package:seven_paradises/utils/image_feed/image_feed.dart';

import 'tab_bar_design.dart';

class NewTabBarView extends StatelessWidget {
  final bool value;
  final Function toggle;
  NewTabBarView({@required this.value, this.toggle});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: animation
            TabBarDesign(title: 'Gallery', action: toggle, isActive: value),
            const SizedBox(width: 20.0),
            TabBarDesign(title: 'Liked', action: toggle, isActive: !value),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: value ? ImageFeed() : ImageFeed())
      ],
    );
  }
}
