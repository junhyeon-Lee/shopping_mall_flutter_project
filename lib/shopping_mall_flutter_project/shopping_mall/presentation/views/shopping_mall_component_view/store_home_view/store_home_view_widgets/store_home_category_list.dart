import 'package:flutter/material.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/presentation/common_widgets/app_static_reference_data.dart';

///카테고리 그리드뷰
class StoreHomeCategoryList extends StatelessWidget {
  const StoreHomeCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categoryImageList = [
      'assets/images/sample.png',
      'assets/images/pika.png',
      'assets/images/sample.png',
      'assets/images/pika.png',
      'assets/images/sample.png',
      'assets/images/pika.png',
      'assets/images/sample.png',
      'assets/images/pika.png'
    ];
    List<String> categoryTextList = ['신상품', '세트', '바다낚시', '민물낚시', '낚시대', '릴', '낚시줄', '루어,미끼'];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: 8, //item 개수
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //1 개의 행에 보여줄 item 개수
            childAspectRatio: 82 / 112, //item 의 가로 1, 세로 2 의 비율
            mainAxisSpacing: 10, //수평 Padding
            crossAxisSpacing: 10, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int index) {
            return StoreHomeCategoryListItem(
              index: index,
              categoryImage: categoryImageList[index],
              categoryText: categoryTextList[index],
            );
          }),
    );
  }
}

///카테고리 그리드뷰 아이템
class StoreHomeCategoryListItem extends StatelessWidget {
  const StoreHomeCategoryListItem(
      {Key? key, required this.categoryText, required this.categoryImage, required this.index})
      : super(key: key);

  final String categoryText;
  final String categoryImage;
  final int index; //인덱스를 받아서 버튼을 어떤 페이지로 연결할 지 정할 예정

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*여기에 이동 함수가 들어갈 예정*/
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            CircleAvatar(
              radius: AppStaticReferenceData.deviceWidth * 0.1,
              backgroundImage: const AssetImage('assets/images/pika.png'),
            ),
            const Text('민물낚시'),
          ],
        ),
      ),
    );
  }
}
