import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/model/facebook/album/album.dart';
import 'package:seven_paradises/model/facebook/album/album_paging.dart';
import 'package:seven_paradises/model/facebook/facebook.dart';
import 'package:seven_paradises/model/facebook/photo/photo.dart';
import 'package:seven_paradises/views/addNewPost/photoGrid/photoGrid.dart';

import 'device/mobile.dart';
import 'device/web.dart';

class AlbumGrid extends StatefulWidget {
  final Facebook facebook;
  AlbumGrid({this.facebook});

  @override
  _AlbumGridState createState() => _AlbumGridState();
}

class _AlbumGridState extends State<AlbumGrid> {
  Album _selectedAlbum;
  List<Album> _albums = [];
  String _albumsNextLink;
  List<Photo> _photos = [];
  String _photosNextLink;
  List<Photo> _selectedPhotos;

  @override
  void initState() {
    _fetchAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        desktop: WebAlbumGrid(),
        mobile:
            MobileAlbumGrid(albums: _albums, onAlbumSelected: onAlbumSelected),
      ),
    );
  }

  Future<void> _fetchAlbums() async {
    AlbumPaging albums = await widget.facebook.fetchAlbums();
    setState(() {
      _albums.addAll(albums.data);
      _albumsNextLink = albums.pagination.next;
    });
  }

  void onAlbumSelected(Album album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoGrid(
          facebook: widget.facebook,
          album: album,
        ),
      ),
    );
  }
}
