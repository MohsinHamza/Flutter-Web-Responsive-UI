import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

Widget tickMark(
    {IconData icon = Icons.done_rounded,
      double vSize = 23.97,
      double hSize = 23.97,
      double icoSize = 18.15,
      Color icoColor = Colors.white,
      Color icoBackgroundColor = Palette.DARKTEAL}) =>
    Container(
      height: vSize,
      width: hSize,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: icoBackgroundColor),
      child: Center(
        child: Icon(
          icon,
          size: icoSize,
          color: icoColor,
        ),
      ),
    );