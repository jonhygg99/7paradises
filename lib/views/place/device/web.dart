import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/measures.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';
import 'package:seven_paradises/views/place/widgets/comment_section.dart';
import 'package:seven_paradises/views/place/widgets/comment_text_field.dart';
import 'package:seven_paradises/views/place/widgets/top_view.dart';

class WebPlaceScreen extends StatelessWidget {
  final TextEditingController textController;
  final String id;
  final bool isEmpty;
  final bool isLiked;
  final Function toggleIsEmpty;
  final Function toggleIsLike;
  WebPlaceScreen({
    this.textController,
    this.id,
    this.isEmpty,
    this.isLiked,
    this.toggleIsEmpty,
    this.toggleIsLike,
  });
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      isTopPadding: false,
      view: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: kDefaultWebMaxWidth,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopView(id),
                CommentSection(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: kDefaultWebMaxWidth),
                child: CommentTextField(
                  textController: textController,
                  isEmpty: isEmpty,
                  isLiked: isLiked,
                  toggleIsEmpty: toggleIsEmpty,
                  toggleIsLike: toggleIsLike,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
