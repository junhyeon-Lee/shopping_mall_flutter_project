import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_dto.freezed.dart';
part 'error_dto.g.dart';

@freezed
class ErrorDTO with _$ErrorDTO {
  factory ErrorDTO({
    String? message,
    int? code
  }) = _ErrorDTO;

  factory ErrorDTO.fromJson(Map<String, dynamic> json) => _$ErrorDTOFromJson(json);
}

