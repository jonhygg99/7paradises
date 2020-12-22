import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class GreetingsMessage extends StatelessWidget {
  GreetingsMessage({this.username = ''});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Hi,',
            style: TextStyle(fontSize: 28.0, color: kBlack),
            children: [
              TextSpan(
                text: ' $username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'Let\'s discover a new adventure!',
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
