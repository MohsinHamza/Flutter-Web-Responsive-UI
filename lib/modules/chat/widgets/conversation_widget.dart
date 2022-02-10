import 'package:flutter/material.dart';
import 'package:next_door/models/message_model.dart';
import 'package:next_door/providers/chat_provider.dart';
import 'package:next_door/style/style.dart';
import 'package:provider/provider.dart';

class ConversationWidget extends StatelessWidget {
  final ConversationModel conversationModel;
  const ConversationWidget({Key? key, required this.conversationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: InkWell(
            onTap: () {
              Provider.of<ChatProvider>(context,listen:false).messages =conversationModel ;
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Image.asset(
                      conversationModel.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              conversationModel.name,
                              style: TextStyles.h6.copyWith(
                                  color:
                                      conversationModel.unReadMessages > 0
                                          ? Palette.PRIMARY
                                          : Theme.of(context).primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Visibility(
                              visible: conversationModel.userOnline,
                              child: const CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 6,),
                        Text(
                          conversationModel.lastMessage,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.h5.copyWith(color: Theme.of(context).primaryColor,fontSize: 11),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          conversationModel.messages.last.message,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.h5.copyWith(color: Theme.of(context).primaryColor,fontSize: 13),
                        ),
                        Visibility(
                          visible: conversationModel.unReadMessages > 0,
                          child: Container(
                            margin: const EdgeInsets.only(left: 6),
                            // ignore: prefer_const_constructors
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8),
                            child: Center(
                              child: Text(
                                conversationModel.unReadMessages.toString(),
                                style: TextStyles.h8.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Palette.WHITE),
                              ),
                            ),
                            height: 22,
                            decoration: BoxDecoration(
                                color: Palette.PRIMARY,
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: .5,
          color: Palette.GREY_LIGHT_MORE,
        )
      ],
    );
  }
}

class ConversationModel {
  String imageUrl;
  String name;
  int unReadMessages;
  String lastMessage;
  bool userOnline;
  List<MessageModel> messages;
  ConversationModel(
      {required this.userOnline,
        required this.messages,
      required this.lastMessage,
      required this.unReadMessages,
      required this.imageUrl,
      required this.name});
}
