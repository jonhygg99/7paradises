import 'package:flutter/material.dart';

import 'image_feed_design.dart';

class ImageFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ImageFeedDesign(
          image: 'assets/bali.png',
        ),
        ImageFeedDesign(
          image: 'assets/bali.png',
        ),
        ImageFeedDesign(
          image: 'assets/bali.png',
        ),
        ImageFeedDesign(
          image: 'assets/bali.png',
        ),
        ImageFeedDesign(
          image: 'assets/bali.png',
        ),
        ImageFeedDesign(
          image: 'assets/bali.png',
        ),
        ImageFeedDesign(
          image: 'assets/bali.png',
        ),
        ImageFeedDesign(
          image: 'assets/bali.png',
        ),
      ],
    );
  }
}
