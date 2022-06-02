import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/product_details_dto/product_image_urls_dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/shopping_controller_entity/product_reviews_dto/write_member_dto.dart';

part 'product_reviews_dto.freezed.dart';
part 'product_reviews_dto.g.dart';

@freezed
class ProductReviewsDTO with _$ProductReviewsDTO {
    factory ProductReviewsDTO({
      int? reviewId,
      WriteMemberDTO? writeMember,
      DateTime? createdDate,
      int? rating,
      String? content,
      String? option,
      ProductImageUrlsDTO? reviewImages,

    }) = _ProductReviewsDTO;
    factory ProductReviewsDTO.fromJson(Map<String, dynamic> json) => _$ProductReviewsDTOFromJson(json);
}