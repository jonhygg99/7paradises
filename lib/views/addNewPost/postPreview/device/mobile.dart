import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/postPreview/widgets/descriptionTextField.dart';
import 'package:seven_paradises/views/addNewPost/postPreview/widgets/placeTextField.dart';
import 'package:seven_paradises/views/addNewPost/postPreview/widgets/postButton.dart';

class MobilePostPreview extends StatelessWidget {
  final Photo photo;
  final TextEditingController placeController;
  final TextEditingController descriptionController;
  MobilePostPreview(
      {@required this.photo,
      @required this.placeController,
      @required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtonDesign(isDark: true),
                  const SizedBox(height: 20),
                  getTitle('Select a photo'),
                  const SizedBox(height: 20),
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(photo.source),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  getTitle('Place'),
                  const SizedBox(height: 20),
                  PlaceTextField(controller: placeController),
                  const SizedBox(height: 20),
                  getTitle('Description'),
                  const SizedBox(height: 20),
                  DescriptionTextField(controller: descriptionController),
                  const SizedBox(height: 20),
                ],
              ),
              PostButton(),
            ],
          ),
        ),
      ),
    );
  }
}
