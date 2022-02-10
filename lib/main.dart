import 'package:flutter/material.dart';
import 'package:next_door/modules/registration_screens/login_screen.dart';
import 'package:next_door/providers/chat_provider.dart';
import 'package:next_door/providers/dark_mode_provider.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ChatProvider()),
        ChangeNotifierProvider(create: (_)=>ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (_,themeProvider,__) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home:  const LoginScreen(),
          );
        }
      ),
    );
  }
}

