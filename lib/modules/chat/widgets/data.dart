import 'package:next_door/models/message_model.dart';
import 'package:next_door/modules/chat/widgets/conversation_widget.dart';

List<ConversationModel> inboxConversation = [
  ConversationModel(

      messages: [
        MessageModel(isSent: false,image: 'assets/images/person.png', message: "Hello how are you", sentAT: '5 min ago'),
        MessageModel(isSent: false,image: 'assets/images/person.png', message: "Hello how are you", sentAT: '5 min ago'),
      ],
      userOnline: true,
      lastMessage: '1 Min ago',
      unReadMessages: 2,
      imageUrl: 'assets/images/person.png',
      name: 'Durin buraca'),
  ConversationModel(
      messages: [
        MessageModel(isSent: false,image: 'assets/images/luna.jfif', message: "Hello how are you", sentAT: '5 min ago'),
      ],
      userOnline: true,
      lastMessage: '2 Min ago',
      unReadMessages: 0,
      imageUrl: 'assets/images/luna.jfif',
      name: 'Luna Jhonson'),
  ConversationModel(
      messages: [
        MessageModel(isSent: false,image: 'assets/images/stacy.jfif', message: "Hey,", sentAT: '3 min ago'),
        MessageModel(isSent: false,image: 'assets/images/stacy.jfif', message: "Can we chat?", sentAT: '1 min ago'),
      ],
      userOnline: true,
      lastMessage: 'Just now',
      unReadMessages: 3,
      imageUrl: 'assets/images/stacy.jfif',
      name: 'Stacy Cruz'),
];
List<ConversationModel> archiveConversation = [
  ConversationModel(
    messages: [
      MessageModel(isSent: false,image: 'assets/images/lara.jfif', message: "Hello how are you", sentAT: '5 min ago'),
    ],
      userOnline: true,
      lastMessage: '1 hr ago',
      unReadMessages: 1,
      imageUrl: 'assets/images/lara.jfif',
      name: 'Lara craft'),
  ConversationModel(
      messages: [
        MessageModel(isSent: false,image: 'assets/images/lina.jfif', message: "Hey,", sentAT: '3 min ago'),
        MessageModel(isSent: false,image: 'assets/images/lina.jfif', message: "Can we chat?", sentAT: '1 min ago'),
      ],
      userOnline: true,
      lastMessage: '2 Min ago',
      unReadMessages: 2,
      imageUrl: 'assets/images/lina.jfif',
      name: 'Lina Jhonson'),
  ConversationModel(
      messages: [
        MessageModel(isSent: false,image: 'assets/images/cacy.jfif', message: "Hey,", sentAT: '3 min ago'),
        MessageModel(isSent: false,image: 'assets/images/cacy.jfif', message: "Can we chat?", sentAT: '1 min ago'),
      ],
      userOnline: true,
      lastMessage: 'Just now',
      unReadMessages: 2,
      imageUrl: 'assets/images/cacy.jfif',
      name: 'Cacy Cruz'),
];
