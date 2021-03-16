import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/photoGrid/widgets/photoDesign.dart';

class MobilePhotoGrid extends StatelessWidget {
  final List<Photo> photos;
  final Function onPhotoSelected;
  MobilePhotoGrid({@required this.photos, this.onPhotoSelected});
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(children: [BackButtonDesign(isDark: true)]),
            const SizedBox(height: 20),
            getTitle('Select a photo'),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(photos.length, (index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PhotoDesign(
                    photo: photos[index],
                    onPhotoSelected: onPhotoSelected,
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
