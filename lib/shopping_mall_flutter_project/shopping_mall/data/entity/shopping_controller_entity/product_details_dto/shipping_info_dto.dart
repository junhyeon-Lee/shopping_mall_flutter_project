import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_info_dto.freezed.dart';
part 'shipping_info_dto.g.dart';

@freezed
class ShippingInfoDTO with _$ShippingInfoDTO {
  factory ShippingInfoDTO({
    int? shippingCost,
    int? islandShippingCost,
    int? freeShippingPrice,
    String? shippingCompanyName,
    String? deliveryArrivalAverageDays,
    String? additionalInformation
  }) = _ShippingInfoDTO;
  factory ShippingInfoDTO.fromJson(Map<String, dynamic> json) => _$ShippingInfoDTOFromJson(json);
}