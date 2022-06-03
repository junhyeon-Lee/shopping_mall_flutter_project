import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping_mall_flutter_project/api_repository_impl.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/etc/base_view_model.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/change_shipping_destination.dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/shipping_destination_register_dto.dart';

class ApiViewModel extends BaseViewModel {
  ApiViewModel(
    this._apiRepository,
  );

  final ApiRepository _apiRepository;

  ///샘플 데이터 모델
  ///배송지 수정 sample data
  ChangeShippingDestinationDTO changeShippingDestinationData = ChangeShippingDestinationDTO();
  ///맴버 배송지 추가 sample data
  ShippingDestinationRegisterDTO shippingDestinationRegisterData =ShippingDestinationRegisterDTO();

  ///shopping_controller

  ///PUT///
  // 배송지 수정
  Future changeShippingDestination(ChangeShippingDestinationDTO changeShippingDestinationData) async {
    var response = await _apiRepository.changeShippingDestination(changeShippingDestinationData);
    response.when(success: (data) {
      if (data) {
        //true
      } else {
        //false
      }
    }, error: (e) {
      //error
    });
  }
  // 기본 배송지 변경
  Future changeDefaultShippingDestination(int body, int memberId) async {
    var response = await _apiRepository.changeDefaultShippingDestination(body, memberId);
    response.when(success: (data) {
      if (data) {
        //true
      } else {
        //false
      }
    }, error: (e) {
      //error
    });
  }

  ///POST///
  //맴버 배송지 추가
  Future shippingDestinationRegister(ShippingDestinationRegisterDTO shippingDestinationRegisterData) async {
    var response = await _apiRepository.shippingDestinationRegister(shippingDestinationRegisterData);
    response.when(
        success: (data) {
            showRoundSnackBar(message: '맴버 배송지  변경 성공');
            debugPrint('생성된 배송지 ID   $data');
        },
        error: (e) {});
  }
  //제품 리뷰 등록
  Future productReviewRegister(int productId, int orderProductId, int rating, String content) async {
    var response = await _apiRepository.productReviewRegister(productId, orderProductId, rating, content);
    response.when(
        success: (data) {
          showRoundSnackBar(message: '제품 리뷰 등록 성공');
          debugPrint('생성된 리뷰 ID   $data');
        },
        error: (e) {});
  }
  //제품 QnA 등록
  Future productQnARegister(int productId, String content, bool isSecret, String email) async {
    var response = await _apiRepository.productQnARegister(productId, content, isSecret, email);
    response.when(
        success: (data) {
          showRoundSnackBar(message: '제품 QnA 등록 성공');
          debugPrint('생성된 QnA ID   $data');
        },
        error: (e) {});
  }
  //제품 리뷰 이미지 등록
  Future productReviewImageRegister(File file, int reviewId) async {
    var response = await _apiRepository.productReviewImageRegister(file, reviewId);
    response.when(success: (data) {
      if (data) {
        //true
      } else {
        //false
      }
    }, error: (e) {
      //error
    });
  }

  ///GET///
  //쇼핑홈데이터

  //제품 리뷰 페이징
  Future productReviews(int memberId, int productId, int page, int size, String sort) async {
    var response = await _apiRepository.productReviews(memberId, productId, page, size, sort);
    response.when(success: (data) {
      showRoundSnackBar(message: '제품 리뷰 페이징 성공');
      debugPrint('데이터 조회   ${data.content}');
    }, error: (e) {
      //error
    });
  }
  //제품 상세조회
  Future productDetails(int memberId, int productId) async {
    var response = await _apiRepository.productDetails(memberId, productId);
    response.when(success: (data) {
      showRoundSnackBar(message: '제품 상세조회 성공');
      debugPrint('데이터 조회   ${data.manufacturerName}');
    }, error: (e) {
      //error
    });
  }
  //주문 내역 조회
  Future orderList(int memberId, int page, int size, String sort) async {
    var response = await _apiRepository.orderList(memberId, page, size, sort);
    response.when(success: (data) {
      showRoundSnackBar(message: '주문 내역 조회 성공');
      debugPrint('데이터 조회   ${data.orderBrands}');
    }, error: (e) {
      //error
    });
  }

  ///DELETE///
  // 배송지 삭제
  Future removeShippingDestination(int shippingDestinationId) async {
    var response = await _apiRepository.removeShippingDestination(shippingDestinationId);
    response.when(
        success: (data) {
          if (data) {
            showRoundSnackBar(message: '배송지 삭제 성공');
          } else {
            showRoundSnackBar(message: '배송지 삭제 실패');
          }
        },
        error: (e) {});
  }
  // 제품 삭제
  Future removeProductReview(int reviewId) async {
    var response = await _apiRepository.removeProductReview(reviewId);
    response.when(
        success: (data) {
          if (data) {
            showRoundSnackBar(message: '제품 삭제 성공');
          } else {
            showRoundSnackBar(message: '제품 삭제 실패');
          }
        },
        error: (e) {});
  }


//end
}
