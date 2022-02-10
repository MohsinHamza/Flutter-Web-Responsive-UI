import 'package:flutter/material.dart';
import 'package:next_door/models/category_item_filter_model.dart';
import 'package:next_door/models/finds_card_model.dart';
import 'package:next_door/models/side_menu_item_model.dart';
import 'package:next_door/modules/finds/widgets/filter_dropdown_menu.dart';
import 'package:next_door/modules/finds/widgets/switch.dart';
import 'package:next_door/modules/news_feed/news_feed.dart';
import 'package:next_door/style/style.dart';

import 'categories_widget.dart';

class FilterMenuList{
  static final List<dynamic> filterSideMenu = [
    SideMenuItemModel(title: 'Home', imageName:'assets/icons/arrow-back.png', isSelected: true,linkedPageOrWidget: const NewsFeed()),
    const SizedBox(height: 8,),
    SideMenuItemModel(title: 'All listings', imageName:'assets/icons/finds-icons.png', isSelected: false,linkedPageOrWidget: null),
    const SizedBox(height: 8,),
    SideMenuItemModel(title: 'Your listings', imageName:'assets/icons/profile-icon.png', isSelected: false,linkedPageOrWidget: null),
    const SizedBox(height: 8,),
    SideMenuItemModel(title: 'Saved listings', imageName:'assets/icons/bookmark-icon.png', isSelected: false,linkedPageOrWidget: null),
    const SizedBox(height: 18,),
    Padding(
      padding: const EdgeInsets.only(bottom: 12.0,top: 12),
      child: Text('Filters',style: TextStyles.h5.copyWith(fontWeight: FontWeight.w500,fontSize: 12),),
    ),
    SwitchTile(title: 'Free', onChanged:(value){}),
    const SizedBox(height: 5,),
    SwitchTile(title: 'Discount', onChanged:(value){}),
    const SizedBox(height: 18,),
    Padding(
      padding: const EdgeInsets.only(bottom: 12.0,top: 12),
      child: Text('Show items from',style: TextStyles.h5.copyWith(fontWeight: FontWeight.w500,fontSize: 12),),
    ),
    FilterDropDownMenu(optionList: const ['Hello','Hi','How','Are','You'], onChangedFunction: (val){}),
    Padding(
      padding: const EdgeInsets.only(bottom: 12.0,top: 12),
      child: Text('Categories',style: TextStyles.h5.copyWith(fontWeight: FontWeight.w500,fontSize: 12),),
    ),
    const FindCategories(),
  ];
}



List<CategoryItemFilterModel> categories = [
  CategoryItemFilterModel(title: 'All', isSelected: true),
  CategoryItemFilterModel(title: 'Appliances', isSelected: false),
  CategoryItemFilterModel(title: 'Baby & Kids', isSelected: false),
  CategoryItemFilterModel(title: 'Home Furniture', isSelected: false),
  CategoryItemFilterModel(title: 'Food', isSelected: false),
  CategoryItemFilterModel(title: 'Gardening', isSelected: false),

];


List<FindsCardModel> findsItems = [
  FindsCardModel(
      title: 'Bed Frame',
      imageUrl: 'assets/images/bed-frame.jfif',
      dateAndLocation: 'just now - 8.8ml kensal Rose Wood',
      price: '\$90'
  ),
  FindsCardModel(
      title: 'Kitchen Decor',
      imageUrl: 'assets/images/kitchen.jfif',
      dateAndLocation: '1 min ago - 8.8ml Queens wood',
      price: '\$90'
  ),
  FindsCardModel(
      title: 'Luxury',
      imageUrl: 'assets/images/luxury.jfif',
      dateAndLocation: '1 min ago - 8.8ml Queens wood',
      price: '\$90'
  ),
  FindsCardModel(
      title: 'Sofa',
      imageUrl: 'assets/images/sofa.jfif',
      dateAndLocation: '1 min ago - 8.8ml Queens wood',
      price: '\$90'
  ),
  FindsCardModel(
      title: 'Zuo sofa',
      imageUrl: 'assets/images/Zuo sofa.jfif',
      dateAndLocation: '1 min ago - 8.8ml Queens wood',
      price: '\$90'
  ),
  FindsCardModel(
      title: 'Wall Paint',
      imageUrl: 'assets/images/wall.jfif',
      dateAndLocation: '1 min ago - 8.8ml Queens wood',
      price: '\$90'
  ),
  FindsCardModel(
      title: 'Cupboard',
      imageUrl: 'assets/images/cupboard.jfif',
      dateAndLocation: '1 min ago - 8.8ml Queens wood',
      price: '\$90'
  ),
];