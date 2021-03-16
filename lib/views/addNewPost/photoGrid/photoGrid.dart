import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/model/facebook/album/album.dart';
import 'package:seven_paradises/model/facebook/facebook.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';
import 'package:seven_paradises/model/facebook/photo/photo_paging.dart';
import 'package:seven_paradises/views/addNewPost/postPreview/postPreview.dart';

import 'device/mobile.dart';
import 'device/web.dart';

class PhotoGrid extends StatefulWidget {
  final Facebook facebook;
  final Album album;
  PhotoGrid({this.facebook, this.album});

  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  List<Photo> _photos = [];
  String _photosNextLink;
  List<Photo> _selectedPhotos;

  @override
  void initState() {
    _fetchAlbumSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebPhotoGrid(),
        mobile: MobilePhotoGrid(
          photos: _photos,
          onPhotoSelected: onPhotoSelected,
        ),
      ),
    );
  }

  void _fetchAlbumSelected() async {
    PhotoPaging photos =
        await widget.facebook.fetchPhotosFromAlbum(widget.album);
    setState(() {
      _photos.addAll(photos.data);
      _photosNextLink = photos.pagination.next;
    });
    // _controller.forward();
  }

  void onPhotoSelected(Photo photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostPreview(photo: photo),
      ),
    );
  }
}
