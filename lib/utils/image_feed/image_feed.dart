import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/constants/measures.dart';

import 'image_feed_design.dart';

List<double> _createSizes() {
  final Random random = Random();
  return List.generate(22, (i) => kDefaultHeightImageFeed + random.nextInt(76));
}

class ImageFeed extends StatelessWidget {
  ImageFeed() : _heights = _createSizes();
  final List<double> _heights;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double widthScreen = MediaQuery.of(context).size.width;
        int horizontalValue = 2;
        int tileQuantity = _heights.length;

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
          horizontalValue = 2;
        else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet)
          horizontalValue = 3;
        else if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
          horizontalValue = (widthScreen - kDefaultWebPaddingHorizontal) ~/ 250;

        return StaggeredGridView.countBuilder(
          primary: false,
          crossAxisCount: horizontalValue,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tileQuantity,
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          itemBuilder: (context, index) => ImageFeedDesign(
            image:
                'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
            place: index.toString(),
            height: _heights[index],
          ),
        );
      },
    );
  }
}
