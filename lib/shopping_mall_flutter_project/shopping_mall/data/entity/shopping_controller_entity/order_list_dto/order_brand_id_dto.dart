import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_products_dto.dart';

part 'order_brand_id_dto.freezed.dart';
part 'order_brand_id_dto.g.dart';

@freezed
class OrderBrandIdDTO with _$OrderBrandIdDTO {
    factory OrderBrandIdDTO({

      int? orderBrandId,
      int? brandId,
      String? orderProgressType,
      String? brandName,
      String? brandEngName,
      List<OrderProductsDTO>? orderProducts,

    }) = _OrderBrandIdDTO;
    factory OrderBrandIdDTO.fromJson(Map<String, dynamic> json) => _$OrderBrandIdDTOFromJson(json);
}




