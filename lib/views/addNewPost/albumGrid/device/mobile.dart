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
  MobileAlbumGrid({@required this.albums});

  @override
  _MobileAlbumGridState createState() => _MobileAlbumGridState();
}

class _MobileAlbumGridState extends State<MobileAlbumGrid> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // 24 is for notification bar on Android
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double imageWidth = size.width / 2 - 40.0;

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
              crossAxisCount: 2,
              childAspectRatio: imageWidth / imageWidth,
              shrinkWrap: true,
              // controller: _controller,
              children: List.generate(
                widget.albums.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.all(0.0),
                    child: AlbumDesign(
                      image: widget.albums[index].coverPhoto,
                      title: widget.albums[index].name,
                      count: widget.albums[index].count,
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
