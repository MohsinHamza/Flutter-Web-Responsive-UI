import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String> onchange;
  final VoidCallback onTap;
  final String? hintText;
  final IconData? icon;
  final bool? readOnly;
  final TextEditingController controller;
  final bool? validator;

  const CustomTextField({
    Key? key,
    required this.onchange,
    this.hintText,
    this.icon,
    required this.controller,
    required this.onTap,
    this.readOnly,
    this.validator = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: validator ?? false ? Palette.WARNING : Colors.transparent, width: 1)),
      height: 35,
      child: TextFormField(
        validator: (v) {
          if (v!.contains('@')) {
            return 'Please Enter Valid Email Address';
          }
          return null;
        },
        readOnly: readOnly ?? false,
        onChanged: onchange,
        obscureText: icon !=null && icon == Icons.remove_red_eye?true:false,
        keyboardType: hintText == 'Enter number' ? TextInputType.number : TextInputType.text,
        autofocus: false,
        controller: controller,
        cursorColor: Palette.GREY_LIGHT,
        cursorHeight: 15,
        style: TextStyles.h6.copyWith(color: Palette.BLACK,fontSize: 13),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,

          suffixIcon: icon == null
              ? null
              : Container(
                  width: 46,
                  padding:const EdgeInsets.only(left: 15, right: 10),
                  child: Center(
                    child:CupertinoButton(onPressed: onTap,padding: EdgeInsets.zero,child: Icon(icon!,size: 18,color: Colors.grey[400],)),
                  ),
                ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 20),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyles.h6.copyWith(fontSize: 13,color: Colors.black),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }
}


class TextFields {


  static Widget withoutController(
      {String initialValue = '',
        required String hint,
        int? maxLength,
        bool isFocused = false,
        bool showIcon = true,
        String errorMessage = '',
        TextInputType inputType = TextInputType.text,
        bool secureText = false,
        bool isEmptyValidation = true,
        bool isEmailValidation = false,
        bool isLengthConstraints = false,
        double borderRoundness = 10,
        bool isFilled = true,
        int minimumLength = 8,
        IconData leadingIcon = Icons.search,
        bool isTrailing = false,
        Color trailingIconColor = kIconColor,
        bool isLeading = false,
        String lengthErrorMessage = "",
        String emailInvalidMessage = "",
        int maxLine = 1,
        required TextEditingController controller,
        double? buttonHeight,
        Color? fillColor}) =>
      SizedBox(
        height: 34,
        child: TextField(
          obscureText: secureText,
          keyboardType: inputType,
          controller: controller,
          maxLines: maxLine,
          maxLength: maxLength,
          style: TextStyles.kTextFieldHintStyle,
          autofocus: isFocused,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: kBorderColor,
                  ),
                  borderRadius:
                  BorderRadius.all(Radius.circular(borderRoundness))),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0.5,
                  color: kBorderColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRoundness),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                gapPadding: 5,
                borderSide: const BorderSide(
                  width: 0.5,
                  color: Colors.greenAccent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRoundness),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0.5,
                  color: kBorderColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRoundness),
                ),
              ),
              prefixIcon: const Icon(Icons.search,size: 18,color: Colors.grey,),
              hintText: hint,
              fillColor: Colors.grey[100]!,
              filled: isFilled,
              hintStyle: const TextStyle(
                  fontSize: 13,fontWeight: FontWeight.w900),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2)),
        ),
      );

}

