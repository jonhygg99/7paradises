import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/icons.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class SocialMediaBubbles extends StatelessWidget {
  final Map socialMedia = {
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
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: kWhite,
      padding: EdgeInsets.all(15.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: _getIcon(socialMedia),
      ),
      onPressed: () {
        try {
          if (kIsWeb)
            _launchURLInWeb(url);
          else
            _launchURLInMobile(url);
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
