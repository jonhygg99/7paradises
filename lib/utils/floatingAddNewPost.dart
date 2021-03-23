import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/config/application.dart';
import 'package:seven_paradises/config/routes.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/icons.dart';

class FloatingAddNewPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: FloatingActionButton.extended(
        onPressed: () => navigateToAddNewPost(context),
        label: Text(
          'Add new post',
          style: TextStyle(color: kBlack),
        ),
        icon: kAddNewPostIcon,
        backgroundColor: kWhite,
      ),
      mobile: FloatingActionButton(
        onPressed: () => navigateToAddNewPost(context),
        child: kAddNewPostIcon,
        backgroundColor: kWhite,
      ),
    );
  }
}

void navigateToAddNewPost(BuildContext context) {
  Application.router.navigateTo(
    context,
    Routes.addNewPost,
    transition: TransitionType.none,
  );
}
