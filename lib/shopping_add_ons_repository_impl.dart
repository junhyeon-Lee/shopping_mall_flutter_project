import 'package:dio/dio.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/config/repository_config.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/common/response_entity.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/repository/local/local_shared_preferences.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/repository/remote/base_repository.dart';

class ShoppingAddOnsRepository extends BaseRepository {
  ShoppingAddOnsRepository(Dio dio, LocalSharedPreferences localSP) : super(dio, localSP);

  String memberId = 'sampleId';

  ///DELETE
  /// 위시 제품 제거
  Future<ResponseEntity<bool>> removeWishProduct(int productId) {
    const uri = RepositoryConfig.serverUrl + '/app/addOns/removeWishProduct';

    return request<bool, bool>(
      uri: uri,
      method: HttpMethod.DELETE,
      body: {'body': productId, 'memberId': memberId},
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }

  ///위시 브랜드 제거
  Future<ResponseEntity<bool>> removeWishBrand(int productId) {
    const uri = RepositoryConfig.serverUrl + '/app/addOns/removeWishBrand';

    return request<bool, bool>(
      uri: uri,
      method: HttpMethod.DELETE,
      body: {'body': productId, 'memberId': memberId},
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }

  ///제품 장바구니에서 제거
  Future<ResponseEntity<bool>> removeCartProduct(int productId) {
    const uri = RepositoryConfig.serverUrl + '/app/addOns/removeCartProduct';

    return request<bool, bool>(
      uri: uri,
      method: HttpMethod.DELETE,
      body: {'body': productId, 'memberId': memberId},
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }
}
