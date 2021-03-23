import 'package:flutter/material.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';

class PhotoDesign extends StatelessWidget {
  final Photo photo;
  final Function onPhotoSelected;
  PhotoDesign({this.photo, this.onPhotoSelected});
  @override
  Widget build(BuildContext context) {
    return photo == null
        ? CircularProgressIndicator()
        : RaisedButton(
            onPressed: () => onPhotoSelected(photo),
            padding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(photo.source),
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          );
  }
}
