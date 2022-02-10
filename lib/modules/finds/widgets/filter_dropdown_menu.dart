import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';

class FilterDropDownMenu extends StatefulWidget {
  const FilterDropDownMenu(
      {Key? key,
        this.applyBorder = false,
        required this.optionList,
        required this.onChangedFunction})
      : super(key: key);
  final List<String> optionList;
  final Function(String) onChangedFunction;
  final bool applyBorder;
  @override
  _FilterDropDownMenuState createState() => _FilterDropDownMenuState();
}

class _FilterDropDownMenuState extends State<FilterDropDownMenu> {
  String _initialValue = '';
  @override
  void initState() {
    _initialValue = widget.optionList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 28,
        maxWidth: 200,
      ),
      width: 180,
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 3),
      decoration: BoxDecoration(
        color: Palette.GREY_LIGHT,
        border: Border.all(
            color: widget.applyBorder ? Colors.black : Colors.transparent,
            width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: DropdownButton<String>(
        value: _initialValue,
        icon: const Image(
          image: AssetImage('assets/icons/down_arrow.png',),
          color: Colors.black,
          height: 12,
          width: 12,
        ),
        iconSize: 5,
        isExpanded: true,
        elevation: 16,
        underline: Container(),
        onChanged: (String? newValue) {
          setState(() {
            _initialValue = newValue!;
            widget.onChangedFunction(_initialValue);
          });
        },
        items: widget.optionList.map<DropdownMenuItem<String>>((String? value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                value!,
                style: TextStyles.h5.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
