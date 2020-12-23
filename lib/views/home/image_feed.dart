import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'image_feed_design.dart';

class ImageFeed extends StatelessWidget {
  final Widget bali = ImageFeedDesign(
      image:
          'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80');
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        int defaultSpace = 2;
        final int width = MediaQuery.of(context).size.width.toInt();
        if (sizingInformation.deviceScreenType != DeviceScreenType.mobile) {
          int removedSpace = width ~/ 160 * 10;
          defaultSpace = (width - removedSpace) ~/ 160;
        }
        print(defaultSpace);

        return StaggeredGridView.count(
            primary: false,
            crossAxisCount: defaultSpace * 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: _getChildren(),
            staggeredTiles: _getTiles(defaultSpace));
      },
    );
  }

  List<Widget> _getChildren() {
    List<Widget> widget = [];

    for (int i = 0; i < 22; ++i) widget.add(bali);
    return widget;
  }

  List<StaggeredTile> _getTiles(int defaultSpace) {
    List<StaggeredTile> widget = [];

    for (int i = 0; i < 22; ++i) widget.add(StaggeredTile.fit(defaultSpace));
    return widget;
  }
}

// StaggeredGridView.count(
// primary: false,
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// crossAxisCount: 4,
// mainAxisSpacing: 15.0,
// crossAxisSpacing: 0.0,
// children: [
// ImageFeedDesign(image: 'assets/bali.png'),
// ImageFeedDesign(image: 'assets/bali.png'),
// ImageFeedDesign(image: 'assets/bali.png'),
// ImageFeedDesign(image: 'assets/bali.png'),
// ImageFeedDesign(image: 'assets/bali.png'),
// ImageFeedDesign(image: 'assets/bali.png'),
// ImageFeedDesign(image: 'assets/bali.png'),
// ],
// staggeredTiles: const <StaggeredTile>[
// const StaggeredTile.fit(2),
// const StaggeredTile.fit(2),
// const StaggeredTile.fit(2),
// const StaggeredTile.fit(2),
// const StaggeredTile.fit(2),
// const StaggeredTile.fit(2),
// const StaggeredTile.fit(2),
// const StaggeredTile.fit(2),
// ],
// );
