import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/model/facebook/album/album.dart';
import 'package:seven_paradises/utils/backButton.dart';
import 'package:seven_paradises/utils/device_layouts/mobile_layout.dart';
import 'package:seven_paradises/utils/textCreator.dart';
import 'package:seven_paradises/views/addNewPost/albumGrid/widgets/albumDesign.dart';

class MobileAlbumGrid extends StatefulWidget {
  final List<Album> albums;
  final Function onAlbumSelected;
  MobileAlbumGrid({@required this.albums, @required this.onAlbumSelected});

  @override
  _MobileAlbumGridState createState() => _MobileAlbumGridState();
}

class _MobileAlbumGridState extends State<MobileAlbumGrid> {
  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width / 2 - 40.0;
    return MobileLayout(
      state: NavigationBarState.None,
      isBottomNavigation: false,
      view: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(children: [BackButtonDesign(isDark: true)]),
            const SizedBox(height: 20),
            getTitle('Albums'),
            const SizedBox(height: 20),
            GridView.count(
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: imageWidth / imageWidth,
              shrinkWrap: true,
              // controller: _controller,
              children: List.generate(
                widget.albums.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: AlbumDesign(
                      album: widget.albums[index],
                      onAlbumSelected: widget.onAlbumSelected,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
