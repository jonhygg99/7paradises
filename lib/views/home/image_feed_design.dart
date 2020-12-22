import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/constants/colors.dart';

class ImageFeedDesign extends StatelessWidget {
  ImageFeedDesign({this.image});
  final String image;
  final String place = 'Bali';
  final String distance = '2.834 km';
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double defaultWidth = 160.0;
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
          defaultWidth = 160.0;
        else
          defaultWidth = MediaQuery.of(context).size.width / 2 - 30;

        return Stack(
          children: [
            Container(
              width: defaultWidth,
              height: _getHeight(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image),
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
            Positioned(
              bottom: 10,
              right: 15,
              child: FaIcon(
                FontAwesomeIcons.instagram,
                color: kWhite,
              ),
            ),
          ],
        );
      },
    );
  }

  double _getHeight() {
    double defaultValue = 170.0;
    Random random = Random();

    return defaultValue + random.nextInt(56);
  }
}
