import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/icons.dart';

class ImageFeedDesign extends StatelessWidget {
  ImageFeedDesign({this.image, this.place, this.height});
  final String image;
  final String place;
  final String distance = '2.834 km';
  final double height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
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
                place,
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
        Positioned(bottom: 10, right: 15, child: kInstagramLigth),
      ],
    );
  }
}
