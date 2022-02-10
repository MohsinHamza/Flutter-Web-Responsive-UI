import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/providers/dark_mode_provider.dart';
import 'package:next_door/style/style.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        Text('Dark mode',style: TextStyles.h5.copyWith(fontSize: 11,fontWeight: FontWeight.w600),),
        const SizedBox(width: 3,),
        Expanded(
          child: CupertinoSwitch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              final provider = Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(value);
            },
          ),
        ),
      ],
    );
  }
}