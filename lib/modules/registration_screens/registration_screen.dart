import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/buttons.dart';
import 'package:next_door/common_ui_widgets/text_fields.dart';
import 'package:next_door/data.dart';
import 'package:next_door/modules/news_feed/news_feed.dart';
import 'package:next_door/modules/registration_screens/widgets/widgets.dart';
import 'package:next_door/style/style.dart';

import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool? _validatorValue;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  IconData _icon=Icons.remove_red_eye;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context,constraints) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body:constraints.maxHeight<690? SingleChildScrollView(
              child: _body(),
            ):_body(),
          );
        }
      ),
    );
  }


  _body()=>Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: SizedBox(
          width: 850,
          child: Row(
            children: [
              Text(
                'Uni People',
                style: TextStyles.h2.copyWith(color: Colors.orange),
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                          const LoginScreen()));
                },
                child: Text(
                  'Login',
                  style: TextStyles.h2
                      .copyWith(color: Colors.blue, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 340,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical:10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border:Border.all(color: Colors.black45),
              borderRadius: const BorderRadius.all(Radius.circular(14)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _loadBigTitle(),
                _loadForm(),
                customDivider(),
                const LoadAuthButtons(isLoginScreen: false,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RichText(
                    text: TextSpan(
                        text: resText1,
                        style: TextStyles.h4.copyWith(color: Theme.of(context).primaryColor),
                        children: [
                          TextSpan(
                            text: resText2,
                            style: TextStyles.h4
                                .copyWith(color: Colors.blue),
                          ),
                          TextSpan(
                            text: resText3,
                            style: TextStyles.h4
                                .copyWith(color: Theme.of(context).primaryColor),
                          ),
                          TextSpan(
                            text: 'partners',
                            style: TextStyles.h4
                                .copyWith(color: Colors.blue),
                          ),
                          TextSpan(
                            text: ' to verify your account',
                            style: TextStyles.h4
                                .copyWith(color: Theme.of(context).primaryColor),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 5.0,top: 10),
        child: SizedBox(
          width: 850,
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Your information is ',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 13,
                          ),
                          children: const [
                            TextSpan(
                              text: 'safe and secure',
                              style:
                              TextStyle(color: Colors.blue, fontSize: 13),
                            ),
                          ])),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Text(
                  'Help',
                  style: TextStyles.h2
                      .copyWith(color: Colors.blue, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );

  _loadBigTitle() => const Padding(
        padding: EdgeInsets.only(
          top: 20,
        ),
        child: Text(
          'Sign up',
          style: TextStyle(
            fontSize: 22,
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
              child: FieldTitle(title: 'Email Address'),
            ),
            CustomTextField(
              validator: _validatorValue,
              controller: _emailController,
              onchange: (String value) {
                setState(() {
                  _validatorValue=true;
                });
              },
              onTap: (){},
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
                  _icon = isTapped?Icons.visibility_off_outlined:Icons.remove_red_eye;
                });
              },
              icon: _icon,
              controller: _passwordController,
              hintText: 'password',
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 15),
              child: Buttons.customPrimaryButton(
                buttonColor: Palette.ORANGE,
                textColor: Colors.white,
                fontSize: 16,
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  // }
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const NewsFeed()));
                  //todo:navigate to main screen
                },
                title: 'Continue',
              ),
            )
          ],
        ),
      );
}
