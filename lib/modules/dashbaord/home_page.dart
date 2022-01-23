import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/modules/dashbaord/widgets/drawer.dart';
import 'package:next_door/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: true,
        title: Text(
          'HOME',
          style: TextStyles.h6
              .copyWith(color: Pallete.BLACK, fontWeight: FontWeight.w600),
        ),
        leading: CupertinoButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          padding: EdgeInsets.zero,
          child: const SizedBox(
              height: 12,
              width: 13,
              child: Icon(
                Icons.menu,
                color: Pallete.BLACK,
              )),
        ),
        backgroundColor: Pallete.WHITE,
        elevation: 0.2,
      ),
      drawer: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 270),
          child: const CustomDrawer()),

    );
  }
}


//Colors.primaries[Random().nextInt(Colors.primaries.length)]