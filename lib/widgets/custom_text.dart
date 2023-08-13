import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  int? maxline;
  double fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  TextOverflow? textOverflow;
  TextDirection? textDirection;
  CustomText({
    required this.text,
    this.maxline,
    this.fontWeight,
    required this.fontSize,
    this.textColor,
    this.textOverflow,
    this.textDirection
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      maxLines: maxline,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          overflow: textOverflow,
          ),
          textDirection: textDirection,
    );
  }
}
