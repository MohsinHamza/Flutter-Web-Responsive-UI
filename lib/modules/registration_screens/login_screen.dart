import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/buttons.dart';
import 'package:next_door/common_ui_widgets/nextdoor_logo.dart';
import 'package:next_door/common_ui_widgets/text_fields.dart';
import 'package:next_door/modules/news_feed/news_feed.dart';
import 'package:next_door/modules/registration_screens/registration_screen.dart';
import 'package:next_door/modules/registration_screens/widgets/widgets.dart';
import 'package:next_door/style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool? _validatorValue;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  IconData _icon = Icons.remove_red_eye;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/farm.jfif'),
          )),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  margin: const EdgeInsets.only(right: 20),
                  width: 350,
                  child: Column(
                    children: [
                      nextDoorLogo(),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 340,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _loadBigTitle(),
                                _loadForm(),
                                customDivider(),
                                const LoadAuthButtons(
                                  isLoginScreen: true,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'No account?',
                                        style: TextStyles.h4.copyWith(color: Theme.of(context).primaryColor),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const RegistrationScreen()));
                                        },
                                        child: Text(
                                          ' Signup ',
                                          style: TextStyles.h4
                                              .copyWith(color: Colors.blue),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        ' or ',
                                        style: TextStyles.h4
                                            .copyWith(color: Theme.of(context).primaryColor),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          ' learn more ',
                                          style: TextStyles.h4
                                              .copyWith(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    StoreButton(
                                        onPressed: () {},
                                        buttonImageName: 'appstore-button'),
                                    StoreButton(
                                        onPressed: () {},
                                        buttonImageName: 'googleplay-button'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _loadBigTitle() => Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
          ),
        ),
      );

  _loadForm() => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: FieldTitle(title: 'Email Address or phone Number'),
            ),
            CustomTextField(
              validator: _validatorValue,
              controller: _emailController,
              onchange: (String value) {
                setState(() {
                  _validatorValue = true;
                });
              },
              onTap: () {},
              hintText: 'email',
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: FieldTitle(title: 'Password'),
            ),
            CustomTextField(
              onchange: (String value) {},
              onTap: () {
                setState(() {
                  isTapped = !isTapped;
                  _icon = isTapped
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye;
                });
              },
              icon: _icon,
              controller: _passwordController,
              hintText: 'password',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: InkWell(
                onTap: () {
                  //todo: add some function
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.h2.copyWith(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 15),
              child: Buttons.customPrimaryButton(
                buttonColor: Palette.ORANGE,
                textColor: Colors.white,
                fontSize: 16,
                onPressed: () async {
                  //Provider.of<NightModeProvider>(context,listen: ).isDarkMode = true;
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  // }
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>const NewsFeed()));
                  //todo:navigate to main screen
                },
                title: 'Login',
              ),
            )
          ],
        ),
      );
}
