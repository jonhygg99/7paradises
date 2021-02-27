import 'package:flutter/material.dart';

Text getTitle(String text) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
  );
}

Text getSubTitle(String text) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
  );
}
