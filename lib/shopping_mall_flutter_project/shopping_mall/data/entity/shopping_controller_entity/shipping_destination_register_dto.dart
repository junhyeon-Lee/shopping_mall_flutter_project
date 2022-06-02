import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_destination_register_dto.freezed.dart';
part 'shipping_destination_register_dto.g.dart';

@freezed
class ShippingDestinationRegisterDTO with _$ShippingDestinationRegisterDTO {
    factory ShippingDestinationRegisterDTO({
    String? name,
    String? recipientName,
    String? phoneNumber,
    String? additionalPhoneNumber,
    String? address,
    String? detailAddress,
    String? shippingRequest,
    bool? isDefaultShippingDestination
    }) = _ShippingDestinationRegisterDTO;
    factory ShippingDestinationRegisterDTO.fromJson(Map<String, dynamic> json) => _$ShippingDestinationRegisterDTOFromJson(json);
}