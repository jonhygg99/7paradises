import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/constants/colors.dart';

class TabBarDesign extends StatelessWidget {
  final String title;
  final Function action;
  final bool isActive;
  TabBarDesign({@required this.title, this.action, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double width = 20.0;
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
        width = 200.0;

      return MaterialButton(
        minWidth: width,
        height: 40,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: isActive ? kBlack : kLightWhite,
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? kWhite : kBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: !isActive ? action : () {},
      );
    });
  }
}
