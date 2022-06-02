import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_brand_id_dto.dart';

part 'order_list_dto.freezed.dart';
part 'order_list_dto.g.dart';

@freezed
class OrderListDTO with _$OrderListDTO {
    factory OrderListDTO({
      int? orderId,
      DateTime? orderedDate,
      List<OrderBrandIdDTO>? orderBrands
    }) = _OrderListDTO;
    factory OrderListDTO.fromJson(Map<String, dynamic> json) => _$OrderListDTOFromJson(json);
}