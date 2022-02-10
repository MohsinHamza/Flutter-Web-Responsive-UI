import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/text_fields.dart';
import 'package:next_door/modules/chat/widgets/chat_bubble_widget.dart';
import 'package:next_door/modules/chat/widgets/conversation_widget.dart';
import 'package:next_door/providers/chat_provider.dart';
import 'package:next_door/services/helper_services/scroll_configuration.dart';
import 'package:next_door/style/style.dart';
import 'package:provider/provider.dart';

class ChatEditor extends StatefulWidget {
  const ChatEditor({Key? key, required this.message}) : super(key: key);
  final ConversationModel message;
  @override
  _ChatEditorState createState() => _ChatEditorState();
}

class _ChatEditorState extends State<ChatEditor> {
  final TextEditingController controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: Theme.of(context).cardColor,
      constraints: const BoxConstraints(
        maxHeight: 690,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    widget.message.name,
                    style: TextStyles.h5.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                controller: _scrollController,
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        // ...widget.message.map((e){
                        //   if(e.isSent == false){
                        //     return ReceiverBubble(message: e,imageUrl: widget.imageUrl,);
                        //   }else{
                        //     return   SenderBubble(message: e,imageUrl: widget.imageUrl,);
                        //   }
                        // })
                        ...widget.message.messages.map((e) => ReceiverBubble(imageUrl: e.image, message: e))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Icon(
                Icons.image,
                size: 28,
                color: Palette.GREY_LIGHT,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFields.withoutController(
                  showIcon: false,
                  hint: 'Enter Message',
                  controller: controller,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                   // Provider.of<ChatProvider>(context,listen: false).messages;
                  },
                  child:  Image(
                    image: const AssetImage('assets/icons/send.png'),
                    height: 28,
                    width: 28,
                    color: Theme.of(context).primaryColor,
                  )),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
