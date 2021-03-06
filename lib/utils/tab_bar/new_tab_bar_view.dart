import 'package:flutter/material.dart';
import 'package:seven_paradises/utils/image_feed/image_feed.dart';
import 'package:seven_paradises/views/favourite/device/widgets/collection_feed.dart';

import 'tab_bar_design.dart';

class NewTabBarView extends StatelessWidget {
  final bool value;
  final Function toggle;
  final List<String> tabBarNames;
  NewTabBarView(
      {@required this.value, this.toggle, @required this.tabBarNames});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: animation
            TabBarDesign(
                title: tabBarNames[0], action: toggle, isActive: value),
            const SizedBox(width: 20.0),
            TabBarDesign(
                title: tabBarNames[1], action: toggle, isActive: !value),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: getTabBarView(),
        )
      ],
    );
  }

  Widget getTabBarView() {
    if (!value && tabBarNames[1] == 'Collections') return CollectionFeed();
    return value ? ImageFeed() : ImageFeed();
  }
}
