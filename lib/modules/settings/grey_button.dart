import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget greyButton(
String text, GestureTapCallback onPress) {
  return CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: onPress,
    child: Container(
      width: 160,
      height: 30,
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[100]!),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
Widget greyButtonWithIcon(IconData icon,String text, GestureTapCallback onPress) {
  return CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: onPress,
    child: Container(
      width: 70,
      height: 34,
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[100]!),
      child: Row(
        children: [
          Icon(icon,size: 14,color: Colors.black,),
          const SizedBox(width: 8,),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}