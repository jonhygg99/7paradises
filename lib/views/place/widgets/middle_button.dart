import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class MiddleButton extends StatelessWidget {
  final bool isLeft;
  final bool rotate;
  final IconData iconData;
  final Function action;
  MiddleButton(
      {@required this.isLeft,
      @required this.iconData,
      this.rotate = false,
      @required this.action});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isLeft ? 50 : 0),
        bottomLeft: Radius.circular(isLeft ? 50 : 0),
        topRight: Radius.circular(isLeft ? 0 : 50),
        bottomRight: Radius.circular(isLeft ? 0 : 50),
      ),
      child: Container(
        width: 70.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isLeft ? 50 : 0),
            bottomLeft: Radius.circular(isLeft ? 50 : 0),
            topRight: Radius.circular(isLeft ? 0 : 50),
            bottomRight: Radius.circular(isLeft ? 0 : 50),
          ),
        ),
        child: Transform.rotate(
          angle: rotate ? 45 * pi / 180 : 0,
          child: Icon(
            iconData,
            color: kBlack,
          ),
        ),
      ),
    );
  }
}
