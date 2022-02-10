import 'dart:collection';

import 'package:next_door/modules/map/map.dart';

import 'models/top_bar_button_model.dart';
import 'modules/chat/chat_page.dart';
import 'modules/notification/notifications_page.dart';

const String resText1 ='By signing up, you agree to our ';
const String resText2 ='Privacy Policy, Cookie Policy, Member Agreement, ';
const String resText3 ='and that we may share your personal information with our ';

final List<TopBarButtonModel> topBarButtons = [
  TopBarButtonModel(
    imageName: 'bell',
    linkedWidget: const NotificationPage(),
    isSelected: true,
  ),
  TopBarButtonModel(
    imageName: 'chat-icon',
    linkedWidget: const Chats(),
    isSelected: false,
  ),
  TopBarButtonModel(
    imageName: 'adduser-icon',
    linkedWidget: const AddUserOnMap(),
    isSelected: false,
  )
];