import 'package:flutter/material.dart';
import 'package:next_door/style/style.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LineIndicator extends StatelessWidget {
  const LineIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      barRadius: const Radius.circular(15),
      animation: true,
      animationDuration: 200,
      backgroundColor: Palette.GREY_LIGHT_MORE,
      progressColor: Palette.DARKTEAL,
      percent: 0.36,
      width: 199,
      lineHeight: 12,
    );
  }
}
