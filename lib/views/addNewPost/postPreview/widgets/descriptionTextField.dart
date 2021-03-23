import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class DescriptionTextField extends StatelessWidget {
  final TextEditingController controller;
  DescriptionTextField({@required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontWeight: FontWeight.bold),
      cursorColor: kBlack,
      maxLines: 6,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20.0),
        hintText: 'Show us the way to arrive to your marvelous place',
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
