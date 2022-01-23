import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons {
  static Widget customPrimaryButton(
          {double buttonWidth = 178.87,
          double? buttonHeight,
          double borderRoundness = 5.0,
          double fontSize = 20.0,
          Color textColor = Colors.white,
          Color? borderColor,
          FontWeight fontWeight = FontWeight.w600,
          title = 'See all',
          required Function onPressed,
          Color buttonColor = Colors.green}) =>
      InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          width: buttonWidth,
          height: buttonHeight ?? 35,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(borderRoundness),
              ),
              border: Border.all(color: borderColor ?? buttonColor)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: textColor, fontSize: fontSize, fontWeight: fontWeight),
            ),
          ),
        ),
      );
  static Widget outlinePrimaryButton(
          {Color textColor = Colors.blue,
          Color borderColor = Colors.blue,
          Color buttonColor = Colors.green,
          title = 'See all',
          double borderRoundness = 25.0,
          double fontSize = 10.0,
          double containerWidth = 77.0,
          double containerHeight = 35.0,
          required Function onPressed}) =>
      InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 50,
            minHeight: 30,
          ),
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRoundness),
            ),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w400),
          )),
        ),
      );

  static Widget submitButton({
    title = 'Submit',
    required Function onPressed,
    double buttonWidth = 40.87,
    double buttonHeight = 13.54,
    double fontSize = 14,
  }) =>
      InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      );
}
