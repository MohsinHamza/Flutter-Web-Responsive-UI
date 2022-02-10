import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/buttons.dart';
import 'package:next_door/style/style.dart';

import 'line_percent_indicator.dart';

class InviteNeighbours extends StatelessWidget {
  const InviteNeighbours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235,
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)) ,
          color:Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 3),
              color: Theme.of(context).shadowColor,
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Ruislip',
            style: TextStyles.h3
                .copyWith(fontWeight: FontWeight.bold,fontSize: 23,color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '13,324 Neighbours',
            style: TextStyles.h5.copyWith(
                fontWeight: FontWeight.w400, fontSize: 13,),
          ),
          const SizedBox(
            height: 12,
          ),
          const Image(
            image:
            AssetImage('assets/images/ruislip-group.png'),
            height: 100,
            width: double.infinity,
          ),
          const SizedBox(
            height: 12,
          ),
          const LineIndicator(),
          const SizedBox(
            height: 12,
          ),
          RichText(
              text: TextSpan(
                  text: '36%',
                  style: TextStyles.h5.copyWith(
                      color: Palette.DARKTEAL,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                        text: ' of 3,230 households',
                        style:
                        TextStyles.h5.copyWith(fontSize: 13,fontWeight: FontWeight.w400)),
                  ])),
          const SizedBox(
            height: 12,
          ),
          Buttons.customPrimaryButton(
              onPressed: () {},
              buttonColor: Palette.DARKTEAL,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              title: 'Invite Neighbours',
              buttonHeight: 35)
        ],
      ),
    );
  }
}