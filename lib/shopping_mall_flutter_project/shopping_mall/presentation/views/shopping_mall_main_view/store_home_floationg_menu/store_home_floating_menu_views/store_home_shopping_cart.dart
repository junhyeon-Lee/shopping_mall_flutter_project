import 'package:flutter/material.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/presentation/common_widgets/app_appbars.dart';

class StoreHomeShoppingCart extends StatelessWidget {
  const StoreHomeShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: '장바구니'),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
