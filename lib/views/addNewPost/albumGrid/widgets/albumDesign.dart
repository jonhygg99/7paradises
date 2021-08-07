import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/model/facebook/album/album.dart';

// ignore: non_constant_identifier_names
Widget AlbumDesign(Album album, Function onAlbumSelected, double albumSize) {
  final countWidth = albumSize / 4;
  return album == null
      ? CircularProgressIndicator()
      : ElevatedButton(
          onPressed: () => onAlbumSelected(album),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Container(
            width: albumSize,
            height: albumSize,
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
                  top: albumSize - 30.0,
                  child: Container(
                    width: albumSize,
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
                  left: albumSize - countWidth,
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
          ),
        );
}
