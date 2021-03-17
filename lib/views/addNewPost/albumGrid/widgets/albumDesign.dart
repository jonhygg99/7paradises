import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/model/facebook/album/album.dart';

class AlbumDesign extends StatelessWidget {
  final Album album;
  final Function onAlbumSelected;
  AlbumDesign({@required this.album, @required this.onAlbumSelected});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final imageWidth = width / 2 - 40.0;
    final countWidth = width / 5 - 40.0;
    return album == null
        ? CircularProgressIndicator()
        : RaisedButton(
            onPressed: () => onAlbumSelected(album),
            padding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(album.coverPhoto),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                Positioned(
                  top: imageWidth - 30.0,
                  child: Container(
                    width: imageWidth,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: kBlackOpacity50,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Center(
                        child: Text(
                          album.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: kWhite, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: imageWidth - countWidth,
                  child: Container(
                    width: countWidth,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: kBlackOpacity50,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        album.count.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
