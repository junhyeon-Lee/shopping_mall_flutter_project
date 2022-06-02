import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/common/member_token_info_dto.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/common/response_entity.dart';
import '../../../../config/repository_config.dart';
import '../../entity/common/error_dto.dart';
import '../local/local_shared_preferences.dart';

enum HttpMethod { GET, POST, PUT, DELETE }

class BaseRepository {
  BaseRepository(this.dio, this.localSP);

  final Dio dio;
  final LocalSharedPreferences localSP;

  var isRefreshTokenRequest = false;

  /// 네트워크 요청 메서드 (가독성때문에 만듬)
  /// @author burger
  ///
  /// @generic T - 네트워크 요청 응답 json 타입 ,onSuccess 파라미터 타입
  /// @generic F - 메서드 return 타입
  ///
  /// @param authorization - header Authorization 에 들아갈 값
  /// @param onSuccess - 네트워크 요청 200
  /// @param onError - 네트워크 요청 에러
  Future<ResponseEntity<F>> request<T, F>({
    required String uri,
    required HttpMethod method,
    Map<String, dynamic>? queryParameter,
    FormData? file,
    body,
    String? authorization,
    required Future<ResponseEntity<F>> Function(T data) onSuccess,
    required Future<ResponseEntity<F>> Function(Future<ResponseEntity<F>> error) onError,
  }) async {
    late Response response;
    var option = Options(headers: authorization != null ? {'Authorization': authorization} : {});

    try {
      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(uri, options: option, queryParameters: queryParameter);
          break;
        case HttpMethod.POST:
          response = await dio.post(uri, options: option, queryParameters: queryParameter, data: file ?? body);
          break;
        case HttpMethod.PUT:
          response = await dio.put(uri, options: option, queryParameters: queryParameter, data: body);
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(uri, options: option, queryParameters: queryParameter, data: body);
          break;
      }

      if (response.statusCode == HttpStatus.ok) {
        if (T.toString().contains("List<Map<String, dynamic>>")) {
          var data = (response.data as List<dynamic>).map((e) => Map<String, dynamic>.from(e)).toList();
          return await onSuccess(data as T);
        } else if (T.toString().contains("Map<String, dynamic>")) {
          try {
            return await onSuccess(response.data as T);
          } catch (e) {
            return await onSuccess(jsonDecode(response.data));
          }
        } else {
          return await onSuccess(response.data as T);
        }
      } else {
        return onDioErrorHandler<T, F>(response.data,
            uri: uri,
            m: method,
            q: queryParameter,
            body: body,
            authorization: authorization,
            onSuccess: (data) => onSuccess(data),
            onError: (e) => onError(e));
      }
    } on DioError catch (e) {
      return onDioErrorHandler<T, F>(e,
          uri: uri,
          m: method,
          q: queryParameter,
          body: body,
          authorization: authorization,
          onSuccess: (data) => onSuccess(data),
          onError: (e) => onError(e));
    }
  }

  Future<ResponseEntity<T>> successDTO<T>(T data) {
    return Future.value(ResponseEntity.success(data));
  }

  Future<ResponseEntity<T>> onErrorHandler<T>(Response response) async {
    var errorDTO = ErrorDTO.fromJson(jsonDecode(response.data));

    return ResponseEntity.error(errorDTO);
  }

  Future<ResponseEntity<F>> onDioErrorHandler<T, F>(
      DioError e, {
        required String uri,
        required Future<ResponseEntity<F>> Function(Future<ResponseEntity<F>> p) onError,
        required Future<ResponseEntity<F>> Function(T) onSuccess,
        required HttpMethod m,
        Map<String, dynamic>? q,
        body,
        String? authorization,
      }) async {
    var errorDTO = ErrorDTO.fromJson(Map<String, dynamic>.from(e.response?.data));

    /// invalidAccessToken -> refresh access token
    if ((errorDTO.code == 600 || errorDTO.code == 601 || errorDTO.code == 610) && !isRefreshTokenRequest) {
      isRefreshTokenRequest = true;
      if (authorization == null || authorization.isEmpty) {
        isRefreshTokenRequest = false;
        return ResponseEntity.error(errorDTO);
      }
      var tokenInfo = await postRefreshToken();
      tokenInfo.when(success: (data) {
        localSP.updateMemberTokenInfo(data);
        return request(
          uri: uri,
          method: m,
          onSuccess: onSuccess,
          onError: onError,
          queryParameter: q,
          body: body,
          authorization: data.accessToken,
        );
      }, error: (e) {
        isRefreshTokenRequest = false;
        return ResponseEntity.error(errorDTO);
      });
      isRefreshTokenRequest = false;
      return ResponseEntity.error(errorDTO);
    } else {
      isRefreshTokenRequest = false;
      return ResponseEntity.error(errorDTO);
    }
  }

  Future<ResponseEntity<MemberTokenInfoDTO>> postRefreshToken() async {
    const uri = RepositoryConfig.serverUrl + '/common/refreshToken';
    final memberId = await localSP.memberUUID;
    final refreshToken = await localSP.refreshToken;

    return request<Map<String, dynamic>, MemberTokenInfoDTO>(
      uri: uri,
      body: {'memberId': memberId},
      method: HttpMethod.POST,
      authorization: refreshToken,
      onSuccess: (data) => successDTO(MemberTokenInfoDTO.fromJson(Map<String, dynamic>.from(data))),
      onError: (error) => error,
    );
  }
}
