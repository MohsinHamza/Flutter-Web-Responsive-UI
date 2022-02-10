import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/buttons.dart';
import 'package:next_door/common_ui_widgets/main_side_menu.dart';
import 'package:next_door/common_ui_widgets/topbar_with_icons.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/services/helper_services/side_menu_items.dart';
import 'package:next_door/style/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 960,
          child: TopBarWithIcons(),
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 900,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideMenu(
                  menuList: CustomSideMenuItems.mainScreenSideMenu,
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyCustomScrollBehavior(),
                    child: Scrollbar(
                      controller:_controller,
                      child: SingleChildScrollView(
                        controller: _controller,
                        child: Column(
                          children: [
                            _profileModule(),
                            _groupModule(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
      ),
    );
  }
  _profileModule()=>Padding(
    padding: const EdgeInsets.only(top: 8,left: 15 ),
    child: Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: const Offset(0, 3),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ]),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0,right: 15),
                child: CircleAvatar(
                  radius: 78,
                  backgroundImage: AssetImage(
                      'assets/images/person.png'),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dorin Buraca',
                      style: TextStyles.h2
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      'Nextdoor Ruislip',
                      style: TextStyles.h5
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              Buttons.customButtonWithLeadingIcon(
                  title: 'Connect',
                  buttonImageName: 'adduser-icon',
                  onPressed: () {}),
              const SizedBox(
                width: 6,
              ),
              Buttons.customButtonWithLeadingIcon(
                  title: 'Message',
                  buttonImageName: 'chat-icon',
                  onPressed: () {},
                  textColor: Colors.black,
                  buttonColor: Palette.GREY_LIGHT_MORE),
              const SizedBox(
                width: 6,
              ),
              Buttons.customButtonWithLeadingIcon(
                  buttonWidth:60,
                  onPressed: () {},
                  textColor: Colors.black,
                  buttonColor: Palette.GREY_LIGHT_MORE),
            ],
          ),
        ],
      ),
    ),
  );
  _groupModule()=>Padding(
    padding: const EdgeInsets.only(top: 20,left: 15 ),
    child: Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color:Theme.of(context).shadowColor,
              offset: const Offset(0, 3),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ]),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Groups',
                style: TextStyles.h5
                    .copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w700),
              ),
              Text(
                'See all(14)',
                style: TextStyles.h5
                    .copyWith(color: Colors.blue,fontWeight: FontWeight.w600),
              ),
            ],
          ),
          ...List.generate(6, (index) => const GroupTile())
        ],
      ),
    ),
  );
}


class GroupTile extends StatelessWidget {
  const GroupTile({Key? key}) : super(key: key);
/// todo: wiil add GroupTileModel
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12),),
                image: DecorationImage(image: AssetImage('assets/images/person.png',),fit: BoxFit.fill)
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Free Furniture',
                    style: TextStyles.h5
                        .copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '3333 Members - London',
                    style: TextStyles.h7
                        .copyWith(color: Palette.GREY_LIGHT,fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Buttons.customButtonWithLeadingIcon(
              title: 'Join',
              buttonWidth: 50,
              onPressed: () {}),
        ],
      ),
    );
  }
}
