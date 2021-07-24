import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/config/application.dart';
import 'package:seven_paradises/constants/colors.dart';

class BackButtonDesign extends StatelessWidget {
  BackButtonDesign({this.isDark = false});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52.0,
      height: 52.0,
      child: RaisedButton(
        onPressed: () => Application.router.pop(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: isDark ? kBlack : kWhite,
        child: Icon(
          Icons.arrow_back,
          color: isDark ? kWhite : kBlack,
        ),
      ),
    );
  }
}
