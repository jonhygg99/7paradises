import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class CommentDesign extends StatelessWidget {
  final String image;
  final String text;
  final bool isMe;
  CommentDesign({@required this.image, @required this.text, this.isMe = false});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe
            ? const SizedBox(width: 0)
            : CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(image),
              ),
        isMe ? const SizedBox(width: 0) : const SizedBox(width: 15.0),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: isMe ? kBlack : kSuperLightGrey,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                style: TextStyle(color: isMe ? kWhite : kBlack),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
