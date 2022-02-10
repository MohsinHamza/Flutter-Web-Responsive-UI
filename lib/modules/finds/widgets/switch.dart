import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

class SwitchTile extends StatefulWidget {
  const SwitchTile({Key? key,required this.title,required this.onChanged}) : super(key: key);
  final String title;
  final Function(bool) onChanged;
  @override
  _SwitchTileState createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  bool _statusValue=false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 12), // 28
          child: Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.h5.copyWith(fontWeight: FontWeight.w600,fontSize: 12,color: Theme.of(context).primaryColor),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Switch(
              onChanged: (bool value) {
                setState(() {
                  _statusValue = !_statusValue;
                });
              },
              value: _statusValue,
            ),
          ),
        ),
      ],
    );
  }
}
