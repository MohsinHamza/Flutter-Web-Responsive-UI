import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

Widget nextDoorLogo()=>Padding(
  padding: const EdgeInsets.only(top: 12.0,bottom: 5),
  child: Text(
    'Uni People',
    textAlign: TextAlign.center,
    style: TextStyles.h2.copyWith(color: Colors.orange,),
  ),
);