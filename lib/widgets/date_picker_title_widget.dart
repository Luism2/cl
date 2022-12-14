import 'package:register/res/colors.dart';
import 'package:register/utils/constants.dart';
import 'package:register/utils/extensions.dart';
import 'package:flutter/material.dart';

class DatePickerTitle extends StatelessWidget {
  const DatePickerTitle({
    required this.date,
    super.key,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          date.format(kMonthFormatWidthYear),
          style: const TextStyle(
            fontSize: 21,
            color: green,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
