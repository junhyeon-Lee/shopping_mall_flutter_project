import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_token_info_dto.freezed.dart';

part 'member_token_info_dto.g.dart';

@freezed
class MemberTokenInfoDTO with _$MemberTokenInfoDTO {
  factory MemberTokenInfoDTO({
    String? accessToken,
    String? refreshToken,
  }) = _MemberTokenInfoDTO;

  factory MemberTokenInfoDTO.fromJson(Map<String, dynamic> json) => _$MemberTokenInfoDTOFromJson(json);
}
