import 'package:flutter/material.dart';
import 'package:next_door/models/side_menu_item_model.dart';
import 'package:next_door/modules/finds/finds.dart';
import 'package:next_door/style/style.dart';

class CustomSideMenuItems{
  static final List<dynamic> mainScreenSideMenu = [
    SideMenuItemModel(title: 'Home', imageName:'assets/icons/home-icon.png', isSelected: true,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Ruislip', imageName:'assets/icons/ruislip-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Diget', imageName:'assets/icons/digest-icon.png', isSelected: false,linkedPageOrWidget: null),
    const SizedBox(height: 18,),
    Padding(
      padding: const EdgeInsets.only(bottom: 5.0,left: 4),
      child: Text('Categories',style: TextStyles.h5.copyWith(fontWeight: FontWeight.w500,fontSize: 12),),
    ),
    SideMenuItemModel(title: 'Help Map', imageName:'assets/icons/location-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Businesses', imageName:'assets/icons/marketplace.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Finds', imageName:'assets/icons/finds-icons.png', isSelected: false,linkedPageOrWidget: const Finds()),
    SideMenuItemModel(title: 'Local Deals', imageName:'assets/icons/localdeals-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Public Services', imageName:'assets/icons/publicservice-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Events', imageName:'assets/icons/event-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Safety', imageName:'assets/icons/safety-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Lost and Found', imageName:'assets/icons/lostandfound-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Documents', imageName:'assets/icons/documents-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'General', imageName:'assets/icons/general-icon.png', isSelected: false,linkedPageOrWidget: null),
    const SizedBox(height: 18,),
    Padding(
      padding: const EdgeInsets.only(bottom: 5.0,left: 4),
      child: Text('Groups',style: TextStyles.h5.copyWith(fontWeight: FontWeight.w500,fontSize: 12),),
    ),
    SideMenuItemModel(title: 'All Groups', imageName:'assets/icons/group-icon.png', isSelected: false,linkedPageOrWidget: null),
  ];

  static List<dynamic> settingSideMenu = [
    Padding(
      padding: const EdgeInsets.only(bottom: 5.0,left: 4,top: 18),
      child: Text('Settings',style: TextStyles.h5.copyWith(fontWeight: FontWeight.w500,fontSize: 12),),
    ),
    SideMenuItemModel(title: 'Account', imageName:'assets/icons/profile-icon.png', isSelected: true,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Newsfeed Preferences', imageName:'assets/icons/documents-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Privacy', imageName:'assets/icons/privacy-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Notifications', imageName:'assets/icons/notification-bell-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'SMS Alert', imageName:'assets/icons/sms-alert-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Neighbourhoods', imageName:'assets/icons/ruislip-icon.png', isSelected: false,linkedPageOrWidget: null),
    SideMenuItemModel(title: 'Message Preferences', imageName:'assets/icons/message-icon.png', isSelected: false,linkedPageOrWidget: null),

  ];
}