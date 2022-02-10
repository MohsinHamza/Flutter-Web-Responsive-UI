import 'package:flutter/material.dart';
import 'package:next_door/models/message_model.dart';
import 'package:next_door/style/style.dart';

class ReceiverBubble extends StatelessWidget {

  final String imageUrl;
  final MessageModel message;


  const ReceiverBubble(
      {Key? key,required this.imageUrl,required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = 600;

    return Container(
      // color: Colors.blueAccent,
      // width: _width * .6,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
                  radius: 21,
                  child:ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(25)),child: Image.asset(imageUrl,fit: BoxFit.fill,)),
                ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(
                      width: _width * .6,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          // width: _width * .6,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                          child: Text(
                            message.message,
                            style: TextStyles.h6.copyWith(color: Theme.of(context).primaryColor),
                          ),
                          decoration: const BoxDecoration(
                              color: Palette.ORANGE,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                        ),
                      ),
                    ),
              Container(
                width: _width * .3,
                margin: const EdgeInsets.only(right: 20, top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      message.sentAT,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.h8
                          .copyWith(color: Palette.GREY_LIGHT, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SenderBubble extends StatelessWidget {
  final MessageModel message;
  final String imageUrl;

  const SenderBubble({Key? key, required this.message, required this.imageUrl, })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = 600;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
                  width: _width * .78,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                      child: Text(
                        message.message,
                        style: TextStyles.h6.copyWith(color: Palette.WHITE),
                      ),
                      decoration: const BoxDecoration(
                          color: Palette.PRIMARY,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          )),
                    ),
                  ),
                ),
          Container(
            width: _width * .7,
            margin: const EdgeInsets.only(right: 20, top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  message.sentAT,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.h8
                      .copyWith(color: Palette.GREY_LIGHT, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
