import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';

import 'device/mobile.dart';
import 'device/web.dart';

class PostPreview extends StatefulWidget {
  final Photo photo;
  PostPreview({@required this.photo});
  @override
  _PostPreviewState createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {
  TextEditingController placeController;
  TextEditingController descriptionController;

  @override
  void initState() {
    placeController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebPostPreview(
          photo: widget.photo,
          placeController: placeController,
          descriptionController: descriptionController,
        ),
        mobile: MobilePostPreview(
          photo: widget.photo,
          placeController: placeController,
          descriptionController: descriptionController,
        ),
      ),
    );
  }
}
