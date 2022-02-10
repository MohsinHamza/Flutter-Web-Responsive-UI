import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/topbar_with_icons.dart';
import 'package:next_door/modules/chat/chat_editor.dart';
import 'package:next_door/modules/chat/conversation_list.dart';
import 'package:next_door/providers/chat_provider.dart';
import 'package:provider/provider.dart';


class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).cardColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: SizedBox(width: 1300,child: TopBarWithIcons()),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 970,
                    child: Row(
                      children: [
                       const ConversationList(),
                        Expanded(child: Consumer<ChatProvider>(
                          builder: (_,provider,__) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: ChatEditor(message: provider.messages, ),
                            );
                          }
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
