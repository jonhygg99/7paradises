import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/icons.dart';

AppBar settingsAppBar() => AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: kSettingsIcon,
          ),
        )
      ],
    );
