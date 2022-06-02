import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'write_member_dto.freezed.dart';
part 'write_member_dto.g.dart';

@freezed
class WriteMemberDTO with _$WriteMemberDTO {
    factory WriteMemberDTO({
      int? memberId,
      String? nickname,
      String? imageUrl
    }) = _WriteMemberDTO;
    factory WriteMemberDTO.fromJson(Map<String, dynamic> json) => _$WriteMemberDTOFromJson(json);
}