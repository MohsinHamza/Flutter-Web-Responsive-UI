import 'package:flutter/cupertino.dart';

class SideMenuItemModel{
  late String title;
  late String imageName;
  late bool isSelected;
  Widget? linkedPageOrWidget;
  SideMenuItemModel({required this.title,required this.imageName,required this.isSelected,required this.linkedPageOrWidget});
}