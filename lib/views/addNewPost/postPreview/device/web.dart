import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/measures.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/postPreview/widgets/descriptionTextField.dart';
import 'package:seven_paradises/views/addNewPost/postPreview/widgets/imagePreview.dart';
import 'package:seven_paradises/views/addNewPost/postPreview/widgets/placeTextField.dart';
import 'package:seven_paradises/views/addNewPost/postPreview/widgets/postButton.dart';

class WebPostPreview extends StatelessWidget {
  final Photo photo;
  final TextEditingController placeController;
  final TextEditingController descriptionController;
  WebPostPreview(
      {@required this.photo,
      @required this.placeController,
      @required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: SingleChildScrollView(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            double paddingBottom = 20;
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
              paddingBottom = 20;
            else if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) paddingBottom = 80;
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    paddingBottom -
                    50,
                maxWidth: kDefaultWebMaxWidth,
              ),
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
                      ImagePreview(image: photo.source),
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
            );
          },
        ),
      ),
    );
  }
}
