
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

class ReactButton extends StatelessWidget {
  const ReactButton(
      {Key? key,
        this.noOfCount,
        required this.buttonName,
        required this.iconName,
        required this.onPressed})
      : super(key: key);
  final String iconName;
  final String buttonName;
  final Function() onPressed;
  final int? noOfCount;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: SizedBox(
          width: noOfCount!= null ? 95: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/icons/$iconName.png'),
                height: 15,
                width: 15,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                  child: Text(
                    noOfCount != null ? "$noOfCount $buttonName" : buttonName,
                    style: TextStyles.h8
                        .copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}