import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ImagePreview extends StatelessWidget {
  final String image;
  ImagePreview({@required this.image});
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double height = 170;
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
          height = 170;
        else if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
          height = 220;
        else if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
          height = 260;

        return Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        );
      },
    );
  }
}
