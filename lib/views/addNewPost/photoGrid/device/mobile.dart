import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/photoGrid/widgets/photoDesign.dart';

class MobilePhotoGrid extends StatefulWidget {
  final List<Photo> photos;
  MobilePhotoGrid({@required this.photos});

  @override
  _MobilePhotoGridState createState() => _MobilePhotoGridState();
}

class _MobilePhotoGridState extends State<MobilePhotoGrid> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double imageWidth = size.width / 2 - 40.0;

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
                children: List.generate(widget.photos.length, (index) {
                  return Padding(
                    padding: EdgeInsets.all(0.00),
                    child: PhotoDesign(photo: widget.photos[index]),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
