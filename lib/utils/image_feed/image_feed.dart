import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/constants/measures.dart';

import 'image_feed_design.dart';

List<double> _createSizes() {
  Random random = new Random();
  return List.generate(22, (i) => kDefaultHeightImageFeed + random.nextInt(76));
}

class ImageFeed extends StatelessWidget {
  ImageFeed() : _heights = _createSizes();
  final List<double> _heights;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        int horizontalValue = 2;
        int tileQuantity = 1;

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          horizontalValue = 2;
          tileQuantity = 1;
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.desktop) {
          horizontalValue = 4;
          tileQuantity = 2;
        }
        return StaggeredGridView.count(
          primary: false,
          crossAxisCount: horizontalValue,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: _getChildren(),
          staggeredTiles: _getTiles(tileQuantity),
        );
      },
    );
  }

  List<Widget> _getChildren() {
    List<Widget> widget = [];

    for (int i = 0; i < 22; ++i)
      widget.add(
        ImageFeedDesign(
            image:
                'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
            place: i.toString(),
            height: _heights[i]),
      );
    return widget;
  }

  List<StaggeredTile> _getTiles(int tileQuantity) {
    List<StaggeredTile> widget = [];

    for (int i = 0; i < 22; ++i) widget.add(StaggeredTile.fit(1));
    return widget;
  }
}
