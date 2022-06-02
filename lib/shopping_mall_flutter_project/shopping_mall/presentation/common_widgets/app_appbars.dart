import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common_widgets.dart';

///기본 앱바
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,

      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      leading: IconButton(
          icon: const Icon(Icons.close), color: Colors.black, tooltip: '이전페이지로', onPressed: () => Get.back()),
      bottom: PreferredSize(
          child: Container(
            color: Colors.black,
            height: 1,
          ),
          preferredSize: const Size.fromHeight(1.0)),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

///메인 페이지 앱바
class ShoppingMallMainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ShoppingMallMainAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, //그림자효과 제거
      backgroundColor: Colors.white,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: AppColor.inputContainerColor,
            borderRadius: BorderRadius.circular(80),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              CommonText(
                  text: '어떤 상품을 찾고 계신가요?',
                  fontSize: 12,
                  textColor: AppColor.basicGreyTextColor,
                  fontWeight: FontWeight.w500),
              const Icon(
                Icons.search,
              ),
            ],
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      bottom: const TabBar(
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            text: '스토어홈',
          ),
          Tab(
            text: '스토리',
          ),
          Tab(
            text: '한정판',
          ),
          Tab(
            text: '기획전',
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
