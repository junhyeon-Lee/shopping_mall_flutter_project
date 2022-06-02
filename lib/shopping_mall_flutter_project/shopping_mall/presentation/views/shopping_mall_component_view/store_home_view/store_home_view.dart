import 'package:flutter/material.dart';
import 'store_home_view_widgets/store_home_view_widgets.dart';

class StoreHomeView extends StatelessWidget {
  const StoreHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children:  const [
          ///1st: 이미지 슬라이더
          StoreHomeImageSlider(),

          ///2nd: 카테고리 리스트
          StoreHomeCategoryList(),


        ],
      ),
    );
  }
}
