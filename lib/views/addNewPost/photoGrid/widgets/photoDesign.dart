import 'package:flutter/material.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';

// ignore: non_constant_identifier_names
Widget PhotoDesign(Photo photo, Function onPhotoSelected, double photoSize) {
  return photo == null
      ? CircularProgressIndicator()
      : ElevatedButton(
          onPressed: () => onPhotoSelected(photo),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Container(
            width: photoSize,
            height: photoSize,
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
