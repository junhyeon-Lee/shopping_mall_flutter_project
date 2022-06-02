import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/common/member_token_info_dto.dart';
part 'member_login_response_dto.freezed.dart';
part 'member_login_response_dto.g.dart';
enum MemberType { GENERAL, DUMMY, MANAGER, ANONYMOUS }

@freezed
class MemberLoginResponseDTO with _$MemberLoginResponseDTO {
  factory MemberLoginResponseDTO({
    String? uuid,
    String? id,
    MemberType? memberType,
    String? name,
    String? nickname,
    String? phone,
    String? imageUrl,
    bool? isConfirmed,
    bool? messageNotificationReceive,
    bool? replyMessageNotificationReceive,
    MemberTokenInfoDTO? memberTokenInfo,

    int? imageChangedCount
  }) = _MemberLoginResponseDTO;

  factory MemberLoginResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$MemberLoginResponseDTOFromJson(json);
}
