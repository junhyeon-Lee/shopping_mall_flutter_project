import 'package:flutter/material.dart';

///가로, 세로, 색, 둥글기를 받는 컨테이너 (선으로 활욜도 가능하다.)
class CommonContainer extends StatelessWidget {
  const CommonContainer({Key? key, required this.width, required this.height, required this.circular, required this.color}) : super(key: key);

  final double width;
  final double height;
  final double circular;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(height: height,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.all(Radius.circular(circular)
          ),
        ));
  }
}
