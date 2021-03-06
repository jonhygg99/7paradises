import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';
import 'package:seven_paradises/utils/newGridView.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/photoGrid/widgets/photoDesign.dart';

class WebPhotoGrid extends StatelessWidget {
  final List<Photo> photos;
  final Function onPhotoSelected;
  WebPhotoGrid({@required this.photos, this.onPhotoSelected});

  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonDesign(isDark: true),
              const SizedBox(height: 20),
              getTitle('Select a photo'),
              const SizedBox(height: 20),
              NewGridView(
                data: photos,
                action: onPhotoSelected,
                widget: PhotoDesign,
                minSize: 225,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
