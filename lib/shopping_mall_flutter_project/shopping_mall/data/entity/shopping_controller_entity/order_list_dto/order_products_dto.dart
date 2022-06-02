import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_product_info_dto.dart';

part 'order_products_dto.freezed.dart';
part 'order_products_dto.g.dart';

@freezed
class OrderProductsDTO with _$OrderProductsDTO {
    factory OrderProductsDTO({
      int? orderProductId,
      int? productId,
      int? productOptionId,
      int? purchasePrice,
      int? productDiscountPercentage,
      int? purchaseNum,
      OrderProductInfoDTO? orderProductInfo,
      String? orderProductImageUrl,
      String? productOptionName,
      int? optionAdditionalPrice,
    }) = _OrderProductDTO;
    factory OrderProductsDTO.fromJson(Map<String, dynamic> json) => _$OrderProductsDTOFromJson(json);
}