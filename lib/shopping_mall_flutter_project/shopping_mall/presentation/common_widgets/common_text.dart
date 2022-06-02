import 'package:flutter/material.dart';

///text, size, weight 를 받는 text 위젯
class CommonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  const CommonText({Key? key, required this.text, required this.fontSize, required this.textColor, required this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style:
    TextStyle(fontFamily:'NotoSans', fontSize: fontSize, color: textColor, fontWeight: fontWeight),);
  }
}


