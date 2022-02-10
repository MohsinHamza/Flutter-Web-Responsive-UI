import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/nextdoor_logo.dart';
import 'package:next_door/common_ui_widgets/pop_up_menu.dart';
import 'package:next_door/common_ui_widgets/text_fields.dart';
import 'package:next_door/common_ui_widgets/tick_mark.dart';
import 'package:next_door/modules/news_feed/news_feed.dart';
import 'package:next_door/modules/profile_page/profile.dart';
import 'package:next_door/modules/settings/settings.dart';
import 'package:next_door/style/style.dart';

import '../data.dart';
import 'night_mode_button.dart';

class TopBarWithIcons extends StatefulWidget {
  const TopBarWithIcons({Key? key}) : super(key: key);

  @override
  _TopBarWithIconsState createState() => _TopBarWithIconsState();
}

class _TopBarWithIconsState extends State<TopBarWithIcons> {
  double iconSize = 28.0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const NewsFeed()));
                    },child: nextDoorLogo()),
                  ),
                ),
                const Expanded(child: ChangeThemeButtonWidget()),
              ],
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            flex: 2,
            child: CustomTextField(
              onTap: () {},
              hintText: 'Search nextdoor',
              onchange: (String value) {},
              controller: _controller,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...topBarButtons.map(
                  (e) => Expanded(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        for (var element in topBarButtons) {
                          if(element.imageName == e.imageName){
                            setState(() {
                              e.isSelected = true;
                            });}else{
                            element.isSelected = false;
                          }
                            setState(() {

                            });
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>e.linkedWidget));
                      },
                      child: Image(
                        color: e.isSelected?Colors.red:Theme.of(context).primaryColor,
                        image: AssetImage('assets/icons/${e.imageName}.png'),
                        height: iconSize,
                        width: iconSize,
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<PopupMenu>(
                    child: const CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage('assets/images/person.png'),
                    ),
                    onSelected: (item) async {
                      switch (item) {
                        case MenuItems.addBusinessPage:

                          /// todo:
                          break;
                        case MenuItems.bookMark:

                          /// todo:
                          break;
                        case MenuItems.settings:
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const SettingsPage()));
                          break;
                        case MenuItems.help:

                          /// todo:
                          break;
                        case MenuItems.communityGuidelines:

                          /// todo:
                          break;
                        case MenuItems.signOut:

                          /// todo:
                          break;
                      }
                    },
                    itemBuilder: (context) {
                      return [
                         PopupMenuItem(
                            child:ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfilePage()));
                              },
                              title: Text('Dorin Buraca',style: TextStyles.h3.copyWith(color:Theme.of(context).primaryColor),),
                              subtitle: Text('Your profile',style: TextStyles.h8.copyWith(color: Palette.DARKTEAL,fontWeight: FontWeight.w700),),
                              leading: const CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage('assets/images/person.png'),
                              ),
                            ),
                        ),
                        PopupMenuItem(
                          child:ListTile(
                            title: Text('Dorin Buraca',style: TextStyles.h6.copyWith(color:Theme.of(context).primaryColor),),
                            subtitle: Text('Nextdoor Ruislip',style: TextStyles.h8.copyWith(color:Theme.of(context).primaryColor),),
                            leading: const CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage('assets/images/person.png'),
                            ),
                            trailing: tickMark(hSize: 18,vSize: 18,icoSize: 13),
                          ),
                        ),
                        ...MenuItems.items.map(buildItems).toList(),
                      ];
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
  PopupMenuItem<PopupMenu> buildItems(PopupMenu item) => PopupMenuItem(
    value: item,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[100],
            child: Icon(
              item.icon,
              size: 26,
              color: item.iconColor,
            ),
          ),
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Text(
            item.title,
            style: TextStyles.h7
                .copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    ),
  );
}


