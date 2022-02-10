
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        title,
        style: TextStyles.kFieldTitleStyle.copyWith(color: Palette.GREY_LIGHT),
      ),
    );
  }
}

customDivider() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: const [
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('OR'),
          ),
          Expanded(child: Divider()),
        ],
      ),
    );

class LoadAuthButtons extends StatefulWidget {
  const LoadAuthButtons({Key? key,required this.isLoginScreen})
      : super(key: key,);
  final bool isLoginScreen;
  @override
  State<LoadAuthButtons> createState() => _LoadAuthButtonsState();
}

class _LoadAuthButtonsState extends State<LoadAuthButtons> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.24),
          child: AuthButton(
            isIconColorBlack: false,
            text: 'Continue with Google',
            image: 'google',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.24),
          child: AuthButton(
            isIconColorBlack: false,
            text: 'Continue with Facebook',
            image: 'facebook',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.85),
          child: AuthButton(
            isIconColorBlack: false,
            text: 'Continue with Apple',
            image: 'apple',
            onPressed: () {},
          ),
        ),
        Visibility(
          visible: widget.isLoginScreen,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 13.85),
            child: AuthButton(
              isIconColorBlack: true,
              text: 'Email Link',
              image: 'email',
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton(
      {Key? key,
      required this.onPressed,
        required this.isIconColorBlack,
      required this.image,
      required this.text})
      : super(key: key);
  final String image;
  final String text;
  final Function() onPressed;
  final bool isIconColorBlack;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        height: 32,
        width: 340,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(
                image: AssetImage('assets/icons/$image-icon.png'),
                width: 20,
                height: 20,
                color: isIconColorBlack?Colors.black:null,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyles.h2.copyWith(fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class StoreButton extends StatelessWidget {
  const StoreButton(
      {Key? key, required this.onPressed, required this.buttonImageName})
      : super(key: key);
  final Function onPressed;
  final String buttonImageName;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.only(right: 3),
      onPressed: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image(
          image: AssetImage('assets/images/$buttonImageName.png'),
          width: 100,
          height: 50,
        ),
      ),
    );
  }
}
