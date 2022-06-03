import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/config/repository_config.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/change_shipping_destination.dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/order_list_dto/order_list_dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/product_details_dto/product_details_dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/product_reviews_dto/product_reviews_dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/shipping_destination_register_dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/repository/remote/base_repository.dart';
import 'shopping_mall_flutter_project/shopping_mall/data/entity/common/response_entity.dart';
import 'shopping_mall_flutter_project/shopping_mall/data/repository/local/local_shared_preferences.dart';

class ApiRepository extends BaseRepository {
  ApiRepository(Dio dio, LocalSharedPreferences localSP) : super(dio, localSP);

  ///PUT
  ///배송지 수정
  Future<ResponseEntity<bool>> changeShippingDestination(ChangeShippingDestinationDTO changeShippingDestinationData) {
    const uri = RepositoryConfig.serverUrl + '/app/changeShippingDestination';
    return request<bool, bool>(
      uri: uri,
      method: HttpMethod.PUT,
      body: {
        'body': {
          changeShippingDestinationData.shippingDestinationId,
          changeShippingDestinationData.name,
          changeShippingDestinationData.recipientName,
          changeShippingDestinationData.phoneNumber,
          changeShippingDestinationData.additionalPhoneNumber,
          changeShippingDestinationData.address,
          changeShippingDestinationData.detailAddress,
          changeShippingDestinationData.shippingRequest,
          changeShippingDestinationData.isDefaultShippingDestination
        },
        'memberId': 'sampleId'
      },
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }
  ///기본 배송지 변경
  Future<ResponseEntity<bool>> changeDefaultShippingDestination(int body, int memberId) {
    const uri = RepositoryConfig.serverUrl + '/app/changeDefaultShippingDestination';
    return request<bool, bool>(
      uri: uri,
      method: HttpMethod.PUT,
      body: {"body": 0, "memberId": 0},
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }

  ///POST
  /// 맴버 배송지 추가
  Future<ResponseEntity<int>> shippingDestinationRegister(ShippingDestinationRegisterDTO shippingDestinationRegisterData) {
    const uri = RepositoryConfig.serverUrl + '/app/shippingDestinationRegister';
    return request<int, int>(
      uri: uri,
      method: HttpMethod.POST,
      body: {
        'body': {
          shippingDestinationRegisterData.name,
          shippingDestinationRegisterData.recipientName,
          shippingDestinationRegisterData.phoneNumber,
          shippingDestinationRegisterData.additionalPhoneNumber,
          shippingDestinationRegisterData.address,
          shippingDestinationRegisterData.detailAddress,
          shippingDestinationRegisterData.shippingRequest,
          shippingDestinationRegisterData.isDefaultShippingDestination
        },
        'memberId': 'sampleId'
      },
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }
  ///제품 리뷰 등록
  Future<ResponseEntity<int>> productReviewRegister(int productId, int orderProductId, int rating, String content) {
    const uri = RepositoryConfig.serverUrl + '/app/productReviewRegister';
    return request<int, int>(
      uri: uri,
      method: HttpMethod.POST,
      body: {
        'body': {"productId": productId, "orderProductId": orderProductId, "rating": rating, "content": content},
        'memberId': 'sampleId'
      },
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }
  ///제품 QnA 등록
  Future<ResponseEntity<int>> productQnARegister(int productId, String content, bool isSecret, String email) {
    const uri = RepositoryConfig.serverUrl + '/app/productQnARegister';
    return request<int, int>(
      uri: uri,
      method: HttpMethod.POST,
      body: {
        'body': {"productId": productId, "content": content, "isSecret": isSecret, "email": email},
        'memberId': 'sampleId'
      },
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }
  ///제품 리뷰 이미지 등록
  Future<ResponseEntity<bool>> productReviewImageRegister(File file, int reviewId) async {
    const uri = RepositoryConfig.serverUrl + '/app/productReviewImageRegister';

    var formData = FormData.fromMap({'file': await MultipartFile.fromFile(file.path)});

    return request<bool, bool>(
      uri: uri,
      method: HttpMethod.POST,
      queryParameter: {'reviewId': reviewId},
      body: {formData},
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }

  ///GET///
  ///쇼핑홈데이터
  //not yet
  ///제품 리뷰 페이징
  Future<ResponseEntity<ProductReviewsDTO>> productReviews(int memberId, int productId, int page, int size, String sort) {
    const uri = RepositoryConfig.serverUrl + '/app/productReviews';
    return request<Map<String, dynamic>, ProductReviewsDTO>(
      uri: uri,
      method: HttpMethod.GET,
      queryParameter: {
        'memberId': memberId,
        'productId': productId,
        'pageable': {
          "page": page,
          "size": size,
          "sort": [sort]
        }
      },
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(ProductReviewsDTO.fromJson(Map<String, dynamic>.from(data))),
      onError: (error) => error,
    );
  }
  ///제품 상세조회
  Future<ResponseEntity<ProductDetailsDTO>> productDetails(int memberId, int productId) {
    const uri = RepositoryConfig.serverUrl + '/app/productDetails';
    return request<Map<String, dynamic>, ProductDetailsDTO>(
      uri: uri,
      method: HttpMethod.GET,
      queryParameter: {
        'memberId': memberId,
        'productId': productId
      },
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(ProductDetailsDTO.fromJson(Map<String, dynamic>.from(data))),
      onError: (error) => error,
    );
  }
  ///주문 내역 조회
  Future<ResponseEntity<OrderListDTO>> orderList(int memberId, int page, int size, String sort) {
    const uri = RepositoryConfig.serverUrl + '/app/orderList';
    return request<Map<String, dynamic>, OrderListDTO>(
      uri: uri,
      method: HttpMethod.GET,
      queryParameter: {
        'memberId': memberId,
        'pageable': {
          "page": page,
          "size": size,
          "sort": ["sort"]
        }
      },
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(OrderListDTO.fromJson(Map<String, dynamic>.from(data))),
      onError: (error) => error,
    );
  }

  ///DELETE
  /// 배송지 삭제
  Future<ResponseEntity<bool>> removeShippingDestination(int shippingDestinationId) {
    const uri = RepositoryConfig.serverUrl + '/app/removeShippingDestination';
    return request<bool, bool>(
      uri: uri,
      method: HttpMethod.DELETE,
      queryParameter: {'shippingDestinationId': shippingDestinationId},
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }
  /// 제품 삭제
  Future<ResponseEntity<bool>> removeProductReview(int reviewId) {
    const uri = RepositoryConfig.serverUrl + '/app/removeProductReview';
    return request<bool, bool>(
      uri: uri,
      method: HttpMethod.DELETE,
      queryParameter: {'shippingDestinationId': reviewId},
      authorization: '토큰이 들어가는 자리',
      onSuccess: (data) => successDTO(data),
      onError: (error) => error,
    );
  }


//end
}
