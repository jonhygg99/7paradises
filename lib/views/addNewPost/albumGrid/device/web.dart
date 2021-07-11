import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/model/facebook/album/album.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/web_layout.dart';
import 'package:seven_paradises/utils/newGridView.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/albumGrid/widgets/albumDesign.dart';

class WebAlbumGrid extends StatelessWidget {
  final List<Album> albums;
  final Function onAlbumSelected;
  WebAlbumGrid({@required this.albums, @required this.onAlbumSelected});
  @override
  Widget build(BuildContext context) {
    return WebLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonDesign(isDark: true),
              const SizedBox(height: 20),
              getTitle('Albums'),
              const SizedBox(height: 20),
              NewGridView(
                data: albums,
                action: onAlbumSelected,
                widget: AlbumDesign,
                minSize: 225,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
