import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/icons.dart';

import 'comment_design.dart';
import 'middle_button.dart';

class CommentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: kMediumWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              ListView(
                children: _getComments(),
              ),
              Positioned(
                top: -30.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      MiddleButton(
                        isLeft: true,
                        iconData: kAddData,
                        action: () {},
                      ),
                      MiddleButton(
                        isLeft: false,
                        iconData: kAirplaneData,
                        rotate: true,
                        action: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getComments() {
    Map<String, String> comments = {
      'Looks great!':
          'https://images.unsplash.com/photo-1608161317468-535e91d1fa9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
      'Great picture!':
          'https://images.unsplash.com/photo-1608161317468-535e91d1fa9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
      'OMG! How you can be so calm surrounded with sharks?':
          'https://images.unsplash.com/photo-1608161317468-535e91d1fa9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
    };
    List<Widget> widgets = [const SizedBox(height: 15.0)];

    comments.forEach((key, value) {
      print(value);
      widgets.add(CommentDesign(image: value, text: key));
      widgets.add(const SizedBox(height: 15.0));
    });
    widgets.add(
      CommentDesign(
        image:
            'https://images.unsplash.com/photo-1608161317468-535e91d1fa9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
        text: 'Wish I could be there right now!',
        isMe: true,
      ),
    );
    return widgets;
  }
}
