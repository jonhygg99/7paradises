import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class CollectionFeedDesign extends StatelessWidget {
  CollectionFeedDesign(
      {this.image, @required this.title, this.totalPhotos = 0});
  final String image;
  final String title;
  final String distance = '2.834 km';
  final int totalPhotos;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.0,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(image),
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                distance,
                style: TextStyle(color: kWhite),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
