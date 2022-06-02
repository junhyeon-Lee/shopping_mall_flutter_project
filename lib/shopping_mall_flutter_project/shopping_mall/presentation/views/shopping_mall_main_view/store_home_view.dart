import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/payment/payment_dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/presentation/views/common_views/kcp_payment_view.dart';
import '../../../../etc/base_view.dart';
import '../../common_widgets/common_widgets.dart';
import '../../view_models/shopping_mall_main_view_model/store_home_view_model/store_home_view_model.dart';
import '../shopping_mall_component_view/limited_edition_view/limited_edition_view.dart';
import '../shopping_mall_component_view/special_exhibition_view/special_exhibition_view.dart';
import '../shopping_mall_component_view/store_home_view/store_home_view.dart';
import '../shopping_mall_component_view/story_view/story_view.dart';
import '../shopping_mall_drawer_view/shopping_mall_drawer_view.dart';
import 'store_home_floationg_menu/store_home_floating_button.dart';


class StoreHome extends BaseView<StoreHomeViewModel> {
  const StoreHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      ///하단 플로팅 버튼
      floatingActionButton: FloatingActionButton(),
      body: DefaultTabController(
        ///탭바의 아이템 수는 4
        length: 4,
        child: Scaffold(
          ///메인 페이지 사이드바
          endDrawer: ShoppingMallDrawerView(),

          ///탭바 네비게이터를 포함하는 메인 앱바
          appBar: ShoppingMallMainAppbar(),

          ///탭바와 연결되어있는 4개의 뷰
          body: TabBarView(children: [
            StoreHomeView(),
            StoryView(),
            LimitedEditionView(),
            SpecialExhibitionView(),
          ]),
        ),
      ),
    );
  }
}

class FloatingActionButton extends StatelessWidget {
  const FloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      distance: 112.0,
      children: [
        ///북마크 버튼
        ActionButton(
          onPressed: () {

          },
          icon: const Icon(
            Icons.bookmark,
          ),
        ),

        ///좋아요 버튼
        ActionButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
          ),
        ),

        ///장바구니 버튼
        ActionButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart,
          ),
        ),
      ],
    );
  }
}
