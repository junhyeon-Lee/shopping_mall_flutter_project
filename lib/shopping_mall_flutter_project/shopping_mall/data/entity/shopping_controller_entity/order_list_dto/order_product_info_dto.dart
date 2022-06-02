import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_product_info_dto.freezed.dart';
part 'order_product_info_dto.g.dart';
enum MemberType { GENERAL, DUMMY, MANAGER, ANONYMOUS }
@freezed
class OrderProductInfoDTO with _$OrderProductInfoDTO {
    factory OrderProductInfoDTO({


      MemberType? productType,
      String? productName,
      String? productEngName,
      int? productPrice

    }) = _OrderProductInfoDTO;
    factory OrderProductInfoDTO.fromJson(Map<String, dynamic> json) => _$OrderProductInfoDTOFromJson(json);
}


