
import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/main_side_menu.dart';
import 'package:next_door/common_ui_widgets/text_fields.dart';
import 'package:next_door/common_ui_widgets/topbar_with_icons.dart';
import 'package:next_door/modules/registration_screens/widgets/widgets.dart';
import 'package:next_door/modules/settings/grey_button.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/services/helper_services/side_menu_items.dart';
import 'package:next_door/style/style.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      children: [
                        SideMenu(
                          menuList: CustomSideMenuItems.settingSideMenu,
                        ),
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: MyCustomScrollBehavior(),
                            child: Scrollbar(
                              controller: _scrollController,
                              child: SingleChildScrollView(
                                controller: _scrollController,
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
        ));
  }
  _profileModule()=>Padding(
    padding: const EdgeInsets.only(top: 22,left: 22,bottom: 15),
    child: Container(
      width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0,right: 15),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/person.png'),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            'Manage your account name, email and password.',
            style: TextStyles.h5
                .copyWith(color: Palette.GREY_LIGHT,fontWeight: FontWeight.w300,fontSize: 12),
          ),
        ],
      ),
    ),
  );
  _groupModule()=>Padding(
    padding: const EdgeInsets.only(top: 5,left: 15 ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: FieldTitle(title: 'First Name'),
                  ),
                  SizedBox(
                    width: 270,
                    child: CustomTextField(
                      controller: _firstNameController,
                      onchange: (String value) {

                      },
                      onTap: () {},
                      hintText: 'first name',
                    ),
                  ),
                ],),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: FieldTitle(title: 'Last Name'),
                    ),
                    SizedBox(
                      width: 270,
                      child: CustomTextField(
                        onchange: (String value) {},
                        onTap: () {

                        },
                        controller: _lastNameController,
                        hintText: 'last name',
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: RichText(
              text: TextSpan(
                  text:'Neighbours use their real names on nextdoor',
                  style: TextStyles.h4.copyWith(color: Theme.of(context).primaryColor),
                  children: [
                    TextSpan(
                      text:' Learn more',
                      style: TextStyles.h4
                          .copyWith(color: Colors.blue),
                    ),
                  ]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: FieldTitle(title: 'Email Address'),
              ),
              SizedBox(
                width: 270,
                child: CustomTextField(
                  controller: _emailController,
                  onchange: (String value) {

                  },
                  onTap: () {},
                  hintText: 'email address',
                ),
              ),
            ],),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                  text:'Your Neighbours won\'t see this unless you',
                  style: TextStyles.h4.copyWith(color: Theme.of(context).primaryColor),
                  children: [
                    TextSpan(
                      text:' add it to your profile',
                      style: TextStyles.h4
                          .copyWith(color: Colors.blue),
                    ),
                  ]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: FieldTitle(title: 'Password'),
              ),
              greyButton( 'Change Password', (){}),
            ],),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: FieldTitle(title: 'Phone Number'),
              ),
              greyButton( 'Change Phone Number', (){}),
            ],),
        ],
      ),
    ),
  );
}


