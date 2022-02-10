 import 'package:flutter/cupertino.dart';

class TopBarButtonModel{
  bool isSelected;
  Widget linkedWidget;
  // the linked widget is the one which is placed into context when current button is pressed
  String imageName;
  TopBarButtonModel({required this.isSelected,required this.linkedWidget,required this.imageName});
 }