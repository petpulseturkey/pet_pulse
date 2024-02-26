import 'package:flutter/material.dart';

final ButtonStyle homePageButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.all(12),
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  ),
);
