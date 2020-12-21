import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/views/favourite/favourite.dart';
import 'package:seven_paradises/views/home/home.dart';
import 'package:seven_paradises/views/profile/profile.dart';

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        HomeScreen());

Handler favouriteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        FavouriteScreen());

Handler profileHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        ProfileScreen());
