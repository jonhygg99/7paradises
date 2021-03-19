import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/model/facebook/facebook.dart';

import 'albumGrid/albumGrid.dart';
import 'device/mobile.dart';
import 'device/web.dart';

class AddNewPostScreen extends StatefulWidget {
  @override
  _AddNewPostScreenState createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {
  Facebook facebook = Facebook();
  bool isCheckingFB = false;
  bool isLoggedFB = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebAddNewPostScreen(
          facebook: facebook,
          initFBPicker: initFBPicker,
          isCheckingFB: isCheckingFB,
        ),
        mobile: MobileAddNewPostScreen(
          facebook: facebook,
          initFBPicker: initFBPicker,
          isCheckingFB: isCheckingFB,
        ),
      ),
    );
  }

  void isNotCheckingFB() {
    setState(() => isCheckingFB = false);
  }

  void isFBChecking() {
    setState(() => isCheckingFB = true);
  }

  void isFBLogged(isLogged) {
    setState(() => isLoggedFB = isLogged);
  }

  void initFBPicker() {
    facebook
        .checkIfIsLogged(isNotCheckingFB, isFBLogged)
        .then((v) async => {
              if (!isLoggedFB)
                await facebook.login(isFBChecking, isNotCheckingFB, isFBLogged)
            })
        .then((v) => {
              if (isLoggedFB)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlbumGrid(facebook: facebook),
                  ),
                ),
            });
  }
}
