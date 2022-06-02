import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/product_details_dto/product_image_urls_dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/product_details_dto/shipping_info_dto.dart';



part 'product_details_dto.freezed.dart';
part 'product_details_dto.g.dart';

@freezed
class ProductDetailsDTO with _$ProductDetailsDTO {
  factory ProductDetailsDTO({

    int? productId,
    String? productType,
    String? brandName,
    String? brandEndName,
    String? manufacturerName,
    String? manufacturerEngName,
    String? productName,
    String? productEngName,
    int? productPrice,
    int? productDiscountPercentage,
    int? totalQuantity,
    int? remainingQuantity,
    int? totalRating,
    int? totalRatingNum,
    ShippingInfoDTO? shippingInfo,
    int? productWishNum,
    int? brandWishNum,
    int? totalQnANum,
    ProductImageUrlsDTO? productImageUrls,
    ProductImageUrlsDTO? productDescriptionImageUrls,

  }) = _ProductDetailsDTO;
  factory ProductDetailsDTO.fromJson(Map<String, dynamic> json) => _$ProductDetailsDTOFromJson(json);
}







