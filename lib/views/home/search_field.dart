import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';

class SearchField extends StatelessWidget {
  SearchField({this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Icon(Icons.search, color: kBlack),
          Expanded(
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Search a place to remember',
                hintStyle: TextStyle(color: kLightGrey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
