// ignore_for_file: file_names

import 'package:bikehub/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final double width;
  // final Color background;
  final VoidCallback function;
  final String text;
  final bool isUpperCase;
  final double radius;
  final Color textColor;

  const DefaultButton({
    Key? key,
    this.height = 50,
    required this.width,
    // this.background = Colors.blue,
    required this.function,
    required this.text,
    this.isUpperCase = false,
    this.radius = 10.0,
    this.textColor = AppColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 0, 21, 38)),
            borderRadius: BorderRadius.circular(radius),
            color: Color.fromARGB(255, 149, 192, 227)),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
