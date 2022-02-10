import 'package:flutter/material.dart';

class PopupMenu {
  final String title;
  final IconData icon;
  final Color iconColor;
  const PopupMenu(
      {required this.title, required this.icon, required this.iconColor});
}

class MenuItems {
  static List<PopupMenu> items = [addBusinessPage,bookMark,settings,help,communityGuidelines,signOut];
  static const addBusinessPage = PopupMenu(
      title: "Add Business Page", icon: Icons.add, iconColor: Colors.black);
  static const  bookMark = PopupMenu(
      title: "BookMark",
      icon: Icons.bookmark_border_outlined,
      iconColor: Colors.black);
  static  const settings = PopupMenu(
      title: "Settings", icon: Icons.settings, iconColor: Colors.black);
  static  const help = PopupMenu(
      title: "Help", icon: Icons.help_outline_rounded, iconColor: Colors.black);
  static  const communityGuidelines = PopupMenu(
      title: "Community Guidelines",
      icon: Icons.description,
      iconColor: Colors.black);
  static const signOut =
      PopupMenu(title: "Sign out", icon: Icons.logout, iconColor: Colors.red);
}
