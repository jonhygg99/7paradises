import 'package:flutter/material.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';

class PhotoDesign extends StatelessWidget {
  final Photo photo;
  PhotoDesign({this.photo});
  @override
  Widget build(BuildContext context) {
    return photo == null
        ? CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.all(8.0),
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
