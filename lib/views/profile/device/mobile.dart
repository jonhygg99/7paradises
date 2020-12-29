import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/icons.dart';
import 'package:seven_paradises/constants/icons.dart';
import 'package:seven_paradises/constants/icons.dart';
import 'package:seven_paradises/utils/mobile_layout.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class MobileProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.Profile,
      view: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1608161317468-535e91d1fa9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Emily Harmon',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Text(
            'It\'s the not the destination, it\'s the journey',
            style: TextStyle(color: kGrey),
          ),
          const SizedBox(height: 20.0),
          SocialMediaBubbles(),
          const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class SocialMediaBubbles extends StatelessWidget {
  Map socialMedia = {
    SocialMedia.Instagram: 'https://www.instagram.com/',
    SocialMedia.Twitter: 'https://twitter.com/home',
    SocialMedia.Facebook: 'https://www.facebook.com/',
    SocialMedia.YouTube: 'https://www.youtube.com/',
  };
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.0,
      children: _getSocialMedia(socialMedia),
    );
  }

  List<Widget> _getSocialMedia(Map socialMedia) {
    List<Widget> widgets = [];

    socialMedia.forEach(
        (key, value) => widgets.add(_getSocialMediaDesign(key, value)));
    return widgets;
  }

  Widget _getSocialMediaDesign(SocialMedia socialMedia, String url) {
    return MaterialButton(
      minWidth: 0.0,
      elevation: 0.5,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: kWhite,
      padding: EdgeInsets.all(15),
      child: _getIcon(socialMedia),
      onPressed: () {
        try {
          if (Platform.isIOS || Platform.isAndroid)
            _launchURLInMobile(url);
          else
            _launchURLInWeb(url);
        } catch (e) {
          print(e);
        }
      },
    );
  }

  Widget _getIcon(SocialMedia socialMedia) {
    switch (socialMedia) {
      case SocialMedia.Instagram:
        return kInstagramDark;
      case SocialMedia.Twitter:
        return kTwitterDark;
      case SocialMedia.Facebook:
        return kFacebookDark;
      case SocialMedia.YouTube:
        return kYouTubeDark;
      default:
        return const Icon(Icons.public, color: Colors.black);
    }
  }

  _launchURLInMobile(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURLInWeb(String url) {
    html.window.open(url, '');
  }
}
