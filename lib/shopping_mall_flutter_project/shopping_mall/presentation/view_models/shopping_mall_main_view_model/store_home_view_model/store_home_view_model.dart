import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/etc/base_view_model.dart';
import '../../../../data/repository/remote/shopping_mall_main_repository/store_home_repository/store_home_repository_impl.dart';
import '../../../views/shopping_mall_search_view/search_view.dart';

class StoreHomeViewModel extends BaseViewModel{
  StoreHomeViewModel(this._storeHomeRepository);

  final StoreHomeRepository _storeHomeRepository;



  var open = false.obs;



  void floatingButtonOpen(){
   open.value?open.value=false:open.value=true;
  }


  void gotoSearchView(){
    Get.to(const MyHomePage(),
        duration: const Duration(milliseconds: 1000),
        transition: Transition.downToUp);
  }





}