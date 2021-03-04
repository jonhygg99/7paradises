import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/icons.dart';
import 'package:seven_paradises/model/facebook/facebook.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/widgets/bubbleButtonPost.dart';

class MobileAddNewPostScreen extends StatefulWidget {
  MobileAddNewPostScreen();

  @override
  _MobileAddNewPostScreenState createState() => _MobileAddNewPostScreenState();
}

class _MobileAddNewPostScreenState extends State<MobileAddNewPostScreen> {
  Facebook facebook = Facebook();
  Map<String, dynamic> _userData;
  bool _isChecking = true;
  AccessToken _accessToken;

  @override
  void initState() {
    // facebook.login();
    facebook.checkIfIsLogged(isNotChecking, addUserData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonDesign(isDark: true),
                const SizedBox(height: 20),
                getTitle('Upload a new post'),
              ],
            ),
          ),
          Column(
            children: [
              _isChecking
                  ? CircularProgressIndicator()
                  : Text(
                      _userData != null ? _userData["name"] : "NO LOGGED",
                    ),
              RaisedButton(
                onPressed: () => facebook.fetchAlbums(),
                child: Text('User data'),
              ),
              SizedBox(height: 20),
              _accessToken != null
                  ? Text(
                      prettyPrint(_accessToken.toJson()),
                    )
                  : Container(),
              SizedBox(height: 20),
              CupertinoButton(
                color: Colors.blue,
                child: Text(
                  _userData != null ? "LOGOUT" : "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: _userData != null
                    ? () => facebook.logOut(addUserData)
                    : () =>
                        facebook.login(isChecking, isNotChecking, addUserData),
              ),
              SizedBox(height: 50),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BubbleButtonPost(
                icon: kGalleryIcon,
                title: 'Gallery',
                action: () {},
              ),
              BubbleButtonPost(
                icon: kInstagramDark,
                title: 'Instagram',
                action: () {},
              ),
              BubbleButtonPost(
                icon: kFacebookDark,
                title: 'Facebook',
                action: () {},
              ),
              const SizedBox(height: 130)
            ],
          ),
        ],
      ),
    );
  }

  void isNotChecking() {
    setState(() {
      _isChecking = false;
    });
  }

  void isChecking() {
    setState(() {
      _isChecking = true;
    });
  }

  void addUserData(userData) {
    setState(() {
      _userData = userData;
    });
  }
}

String prettyPrint(Map json) {
  print(json);
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
