import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/navigation.dart';

class PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        navigateTo(
            context, NavigationBarState.Profile, NavigationBarState.None);
      },
      padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
      child: Text(
        'Post',
        style: TextStyle(
          color: kWhite,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
