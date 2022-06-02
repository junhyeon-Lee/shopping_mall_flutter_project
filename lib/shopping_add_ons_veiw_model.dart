import 'package:shopping_mall_flutter_project/shopping_add_ons_repository_impl.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/etc/base_view_model.dart';

class ShoppingAddOnsViewModel extends BaseViewModel {
  ShoppingAddOnsViewModel(
      this._shoppingAddOnsRepository,
      );

  final ShoppingAddOnsRepository _shoppingAddOnsRepository;









  ///DELETE///
  // 위시 제품 제거
  Future removeShippingDestination(int productId) async {
    var response = await _shoppingAddOnsRepository.removeWishProduct(productId);
    response.when(
        success: (data) {
          if (data) {
            showRoundSnackBar(message: '위시 제품 제거 성공');
          } else {
            showRoundSnackBar(message: '위시 제품 제거 실패');
          }
        },
        error: (e) {});
  }
}