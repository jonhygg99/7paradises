import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/icons.dart';

class CommentTextField extends StatelessWidget {
  final TextEditingController textController;
  final bool isEmpty;
  final bool isLiked;
  final Function toggleIsEmpty;
  final Function toggleIsLike;
  CommentTextField({
    @required this.textController,
    this.isEmpty,
    this.isLiked,
    this.toggleIsEmpty,
    this.toggleIsLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) => toggleIsEmpty(value),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Write a comment',
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintStyle: TextStyle(color: kLightGrey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      kSendIconData,
                      color: isEmpty ? kGrey : kBlack,
                    ),
                    onTap: isEmpty
                        ? null
                        : () {
                            print('Sent!');
                          },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5.0),
          InkWell(
            onTap: toggleIsLike,
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: kWhite,
                  shape: BoxShape.circle,
                ),
                child: isLiked ? kLike : kNoLike),
          )
        ],
      ),
    );
  }
}
