
import 'package:flutter/material.dart';

import 'modules/dashbaord/home_page.dart';
import 'modules/notification/notifications_page.dart';
import 'modules/signup/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  const RegistrationScreen(),
    );
  }
}

