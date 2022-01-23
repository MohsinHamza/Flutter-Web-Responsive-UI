import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

import '../home_page.dart';
import 'data_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SafeArea(
            child: DrawerHeader(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.lightBlueAccent,
                    child: Text(
                      'JR',
                      style: TextStyles.h2.copyWith(
                          color: Pallete.WHITE,letterSpacing: 1.2, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Julie Richards',
                    style: TextStyles.h7.copyWith(
                        color: Colors.lightBlueAccent,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Julier@example.com',
                    style: TextStyles.h8.copyWith(
                        color: Pallete.GREY_LIGHT,
                        fontWeight: FontWeight.normal),
                  ),
                  const Divider(
                    height: 5,
                    color: Pallete.GREY_LIGHTEST,
                  ),
                ],
              ),
            ),
          ),
          DrawerTile(
              label: 'Home',
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(_)=>const HomePage()));
              }, icon: Icons.home,
          ),
          DrawerTile(
            icon: Icons.person,
              label: 'Profile',
              onPressed: (){}
          ),
          DrawerTile(
            icon: Icons.logout,
              label: 'Sign Out',
              onPressed: (){}
          ),
        ],
      ),
    );
  }
}
