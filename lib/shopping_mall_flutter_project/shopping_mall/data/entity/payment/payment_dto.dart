import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_dto.freezed.dart';
part 'payment_dto.g.dart';

@freezed
class PaymentDTO with _$PaymentDTO {
    factory PaymentDTO({
      String? productName,
      int? totalPrice,
      String? orderedMemberName,
      String? orderedMemberPhoneNumber,
      String? orderedMemberAdditionalPhoneNumber,
      String? orderedMemberEmail
    }) = _PaymentDTO;
    factory PaymentDTO.fromJson(Map<String, dynamic> json) => _$PaymentDTOFromJson(json);
}