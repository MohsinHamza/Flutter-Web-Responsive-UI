import 'package:auth_buttons/auth_buttons.dart';
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
        style: TextStyles.kFieldTitleStyle,
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
            child: Text('Or'),
          ),
          Expanded(child: Divider()),
        ],
      ),
    );

class LoadAuthButtons extends StatefulWidget {
  const LoadAuthButtons({Key? key,})
      : super(key: key);
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
            text: 'Continue with Google',
            image: 'google',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.24),
          child: AuthButton(
            text: 'Continue with Facebook',
            image: 'facebook',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 13.85),
          child: AuthButton(
            text: 'Continue with Apple',
            image: 'apple',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

// iconSize: 22,
// iconBackground: Colors.transparent,
// buttonType: AuthButtonType.secondary,
// buttonColor: Colors.grey,
// elevation: 0,
// borderRadius: 8,
// borderColor: Colors.grey.withOpacity(0.5),
// borderWidth: 0.7,
// height: 32.76,
// width: 317.25,
// textStyle: GoogleFonts.openSans(
// color: Colors.black,
// fontWeight: FontWeight.w700,
// letterSpacing: 1.1,
// fontSize: 13,
// ),
class AuthButton extends StatelessWidget {
  const AuthButton(
      {Key? key,
      required this.onPressed,
      required this.image,
      required this.text})
      : super(key: key);
  final String image;
  final String text;
  final Function() onPressed;
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
