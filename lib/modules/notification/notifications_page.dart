import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';
import 'package:next_door/widgets/text_fields.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final TextEditingController _nextDoorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 1000,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'nextdoor',
                          style: TextStyles.h2.copyWith(color: Pallete.LIME),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          onTap: () {},
                          onchange: (String value) {},
                          controller: _nextDoorController,
                        ),
                      ),
                      const Spacer(flex: 2,),
                      const Icon(Icons.notifications),
                      const Icon(Icons.message),
                      const Icon(Icons.person_add_alt),
                      const CircleAvatar()
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: TextStyles.h2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
