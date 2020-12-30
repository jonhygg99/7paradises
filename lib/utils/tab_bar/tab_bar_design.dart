import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class TabBarDesign extends StatelessWidget {
  final String title;
  final Function action;
  final bool isActive;
  TabBarDesign({@required this.title, this.action, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 20.0,
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
  }
}
