import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seven_paradises/config/application.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/icons.dart';

class TopView extends StatelessWidget {
  final String id;
  TopView(this.id);
  final String distance = '2.834 km';
  final String image =
      'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(image),
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          left: 20.0,
          child: InkWell(
            //TODO: hover color (Button pressed sensation)
            onTap: () => Application.router.pop(context),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          right: 20.0,
          child: CircleAvatar(
            radius: 33,
            backgroundColor: kWhite,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1608161317468-535e91d1fa9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
            ),
          ),
        ),
        Positioned(
          bottom: 30.0,
          left: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                id,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                distance,
                style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(bottom: 30.0, right: 20, child: kInstagramLigth),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 70.0,
          bottom: -30.0,
          child: Row(
            children: [
              MiddleButton(isLeft: true, iconData: Icons.add),
              MiddleButton(
                isLeft: false,
                iconData: Icons.airplanemode_active,
                rotate: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MiddleButton extends StatelessWidget {
  final bool isLeft;
  final bool rotate;
  final IconData iconData;
  MiddleButton(
      {@required this.isLeft, @required this.iconData, this.rotate = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isLeft ? 50 : 0),
          bottomLeft: Radius.circular(isLeft ? 50 : 0),
          topRight: Radius.circular(isLeft ? 0 : 50),
          bottomRight: Radius.circular(isLeft ? 0 : 50),
        ),
      ),
      child: Transform.rotate(
        angle: rotate ? 45 * pi / 180 : 0,
        child: Icon(
          iconData,
          color: kBlack,
        ),
      ),
    );
  }
}