import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_shipping_destination.dto.freezed.dart';
part 'change_shipping_destination.dto.g.dart';

@freezed
class ChangeShippingDestinationDTO with _$ChangeShippingDestinationDTO {
    factory ChangeShippingDestinationDTO({
        int? shippingDestinationId,
        String? name,
        String? recipientName,
        String? phoneNumber,
        String? additionalPhoneNumber,
        String? address,
        String? detailAddress,
        String? shippingRequest,
        bool? isDefaultShippingDestination
    }) = _ChangeShippingDestinationDTO;
    factory ChangeShippingDestinationDTO.fromJson(Map<String, dynamic> json) => _$ChangeShippingDestinationDTOFromJson(json);
}