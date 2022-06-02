import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_urls_dto.freezed.dart';
part 'product_image_urls_dto.g.dart';

@freezed
class ProductImageUrlsDTO with _$ProductImageUrlsDTO {
  factory ProductImageUrlsDTO({
    String? url,
    int? index,
  }) = _ProductImageUrlsDTO;
  factory ProductImageUrlsDTO.fromJson(Map<String, dynamic> json) => _$ProductImageUrlsDTOFromJson(json);
}





