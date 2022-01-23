import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
      onTap: () {
        onPressed();
      },
      horizontalTitleGap: 0.0,
      leading: icon == null
          ? null
          : Icon(
              icon,
              size: 25,
              color: Pallete.GREY_LIGHT,
            ),
      title: Text(
        label,
        style: TextStyles.h8.copyWith(fontWeight: FontWeight.normal,fontSize: 13),
      ),
    );
  }
}
