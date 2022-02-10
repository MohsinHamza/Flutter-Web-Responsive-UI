import 'package:flutter/cupertino.dart';
import 'package:next_door/modules/chat/widgets/conversation_widget.dart';
import 'package:next_door/modules/chat/widgets/data.dart';

class ChatProvider extends ChangeNotifier{
  ConversationModel _messages = inboxConversation[0];

  ConversationModel get messages => _messages;
  set messages(value){
    _messages = value as ConversationModel;
    notifyListeners();
  }
}