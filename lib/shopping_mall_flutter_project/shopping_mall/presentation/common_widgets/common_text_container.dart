import 'package:flutter/material.dart';

///text 위젯을 포함하고 있는 컨테이너
class CommonRoundContainer extends StatelessWidget {
  const CommonRoundContainer({Key? key,
    required this.width, required this.height,
    required this.color, required this.circular,
    required this.text, required this.fontSize,
    required this.textColor, required this.fontWeight}) : super(key: key);

  ///컨테이너 관련 파라미터
  final double width;
  final double height;
  final Color color;
  final double circular;

  ///텍스트 관련 파라미터
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height,
      decoration:  BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(circular)),
      ),

      child: Center(child:
      Text(text,style: TextStyle(fontSize: fontSize, color: textColor, fontWeight: fontWeight),)
      ),
    );
  }
}
