import 'package:flutter/material.dart';

import 'collection_feed_design.dart';

class CollectionFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10.0,
      spacing: 10.0,
      children: _getChildren(),
    );
  }

  List<Widget> _getChildren() {
    List<Widget> widget = [];

    for (int i = 0; i < 22; ++i)
      widget.add(
        CollectionFeedDesign(
          image:
              'https://images.unsplash.com/photo-1609151712779-4f86b3de7308?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80',
          title: i.toString(),
          totalPhotos: i,
        ),
      );
    return widget;
  }
}
