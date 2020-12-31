import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/config/application.dart';
import 'package:seven_paradises/config/routes.dart';
import 'package:seven_paradises/constants/enum.dart';

void navigateTo(BuildContext context, int index, int state) {
  if (index == NavigationBarState.Home && state != NavigationBarState.Home)
    Application.router
        .navigateTo(context, Routes.home, transition: TransitionType.none);
  else if (index == NavigationBarState.Favourite &&
      state != NavigationBarState.Favourite)
    Application.router
        .navigateTo(context, Routes.favourite, transition: TransitionType.none);
  else if (index == NavigationBarState.Profile &&
      state != NavigationBarState.Profile)
    Application.router
        .navigateTo(context, Routes.profile, transition: TransitionType.none);
}
