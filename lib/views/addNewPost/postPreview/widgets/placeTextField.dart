import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class PlaceTextField extends StatelessWidget {
  final TextEditingController controller;
  PlaceTextField({@required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontWeight: FontWeight.bold),
      cursorColor: kBlack,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20.0),
        hintText: 'Pin us this jewel in the map',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kBlack, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kBlack, width: 2.0),
        ),
      ),
    );
  }
}
