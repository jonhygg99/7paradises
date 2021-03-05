import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class AlbumDesign extends StatelessWidget {
  final String image;
  final String title;
  final int count;
  AlbumDesign({this.image, this.title = '', this.count = 1});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final imageWidth = width / 2 - 40.0;
    final countWidth = width / 5 - 40.0;
    return image == null
        ? SizedBox(
            width: imageWidth,
            height: imageWidth,
            // child: CircularProgressIndicator()
          )
        : SizedBox(
            width: imageWidth,
            height: imageWidth,
            child: Stack(
              children: [
                Container(
                  width: imageWidth,
                  height: imageWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                Positioned(
                  bottom: 0,
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
                          title,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Center(
                        child: Text(
                          count.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
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
