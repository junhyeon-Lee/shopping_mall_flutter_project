import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/repository/remote/shopping_mall_main_repository/store_home_repository/store_home_repository_impl.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/presentation/view_models/shopping_mall_main_view_model/store_home_view_model/store_home_view_model.dart';
import '../config/dio_interceptors.dart';
import '../shopping_mall/data/repository/local/local_shared_preferences.dart';


class InitBinding extends Bindings {
  @override
  void dependencies() {
    var dio = Dio();
    dio.interceptors.add(DioInterceptors());

     var localSP = LocalSharedPreferences();

     var storeHomeRepository = StoreHomeRepository(dio, localSP);



     Get.put(StoreHomeViewModel(storeHomeRepository));

  }
}
