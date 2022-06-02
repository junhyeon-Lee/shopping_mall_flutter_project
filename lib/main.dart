import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shopping_mall_flutter_project/shopping_mall/presentation/views/shopping_mall_main_view/store_home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffffff),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      home:  const StoreHome(),
    );
  }
}





