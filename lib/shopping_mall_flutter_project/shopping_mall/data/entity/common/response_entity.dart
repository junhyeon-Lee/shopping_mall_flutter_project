import 'package:freezed_annotation/freezed_annotation.dart';

import 'error_dto.dart';

part 'response_entity.freezed.dart';

@freezed
abstract class ResponseEntity<T> with _$ResponseEntity<T> {
  const factory ResponseEntity.success(T data) = Success;
  const factory ResponseEntity.error(ErrorDTO e) = Error;
}