import 'package:flutter/material.dart';
import 'package:next_door/common_ui_widgets/text_fields.dart';
import 'package:next_door/style/style.dart';

class NearBySearchField extends StatefulWidget {
  const NearBySearchField({Key? key,required this.currentUserImageUrl}) : super(key: key);
  final String currentUserImageUrl;
  @override
  State<NearBySearchField> createState() => _NearBySearchFieldState();
}

class _NearBySearchFieldState extends State<NearBySearchField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(offset: const Offset(1,2),blurRadius: 1,spreadRadius: 1,color: Theme.of(context).shadowColor),
          ]
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(widget.currentUserImageUrl),
        ),
        title: CustomTextField(onchange: (val){}, controller: _controller, hintText:"What's #happening nearby, @neighbour?",onTap: (){}),
      ),
    );
  }
}