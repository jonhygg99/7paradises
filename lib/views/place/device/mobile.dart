import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/views/place/widgets/comment_section.dart';
import 'package:seven_paradises/views/place/widgets/comment_text_field.dart';
import 'package:seven_paradises/views/place/widgets/top_view.dart';

class MobilePlaceScreen extends StatelessWidget {
  final TextEditingController textController;
  final String id;
  final bool isEmpty;
  final bool isLiked;
  final Function toggleIsEmpty;
  final Function toggleIsLike;
  MobilePlaceScreen({
    this.textController,
    this.id,
    this.isEmpty,
    this.isLiked,
    this.toggleIsEmpty,
    this.toggleIsLike,
  });
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: Stack(
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
            child: CommentTextField(
              textController: textController,
              isEmpty: isEmpty,
              isLiked: isLiked,
              toggleIsEmpty: toggleIsEmpty,
              toggleIsLike: toggleIsLike,
            ),
          ),
        ],
      ),
    );
  }
}
