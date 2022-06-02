import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/data/entity/common/member_token_info_dto.dart';
import '../../entity/local_entity/member_login_response_dto.dart';


class LocalSharedPreferences {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  static const _memberInfoKey = '_memberInfoKey';

  Future<String?> get accessToken => findMemberAccessToken();

  Future<String?> get refreshToken => findMemberRefreshToken();

  Future<String?> get memberUUID => findMemberUUID();

  /// 멤버 정보 조회
  Future<MemberLoginResponseDTO?> findMemberInfo() async {
    var pref = await _pref;
    var json = pref.getString(_memberInfoKey);
    if (json == null) return null;
    return MemberLoginResponseDTO.fromJson(jsonDecode(json));
  }

  /// 멤버 정보 저장
  void updateMemberInfo(MemberLoginResponseDTO memberInfo) async {
    var pref = await _pref;
    pref.setString(_memberInfoKey, jsonEncode(memberInfo));
  }

  /// 맴버 닉네임
  void changeMemberNickname(MemberLoginResponseDTO memberInfo, String? nickname) async {
    var memberInfo = await findMemberInfo();
    if (nickname != null) {
      memberInfo = memberInfo!.copyWith(nickname: nickname);
    }
    updateMemberInfo(memberInfo!);
  }

  /// 맴버 이미지 url
  void changeMemberImageUrl(MemberLoginResponseDTO memberInfo, String? imageUrl) async {
    {
      var memberInfo = await findMemberInfo();
      memberInfo = memberInfo!.copyWith(imageUrl: imageUrl, imageChangedCount: (memberInfo.imageChangedCount ?? 0) + 1);
      updateMemberInfo(memberInfo);
    }
  }

  /// 내 정보 관리 업데이트
  void changeMemberInfo(MemberLoginResponseDTO memberInfo, String? name, String? phone) async {
    if (name != null) {
      var memberInfo = await findMemberInfo();
      memberInfo = memberInfo?.copyWith(name: name);
      updateMemberInfo(memberInfo!);
    }
    if (phone != null) {
      var memberInfo = await findMemberInfo();
      memberInfo = memberInfo?.copyWith(phone: phone);
      updateMemberInfo(memberInfo!);
    }
  }

  /// 알림 상태 변경
  void changeAlarmStatus(MemberLoginResponseDTO memberInfo, bool message, bool replyMessage) async {
    var memberInfo = await findMemberInfo();
    memberInfo = memberInfo?.copyWith(messageNotificationReceive: message);
    memberInfo = memberInfo?.copyWith(replyMessageNotificationReceive: replyMessage);
    updateMemberInfo(memberInfo!);
  }

  /// 멤버 accessToken 조회
  Future<String?> findMemberAccessToken() async {
    var memberInfo = await findMemberInfo();
    if (memberInfo?.memberTokenInfo?.accessToken != null) {
      return "Bearer " + memberInfo!.memberTokenInfo!.accessToken.toString();
    } else {
      return '';
    }
  }

  /// refresh 토큰 조회
  Future<String?> findMemberRefreshToken() async {
    var memberInfo = await findMemberInfo();
    if (memberInfo?.memberTokenInfo?.accessToken != null) {
      return "Bearer " + memberInfo!.memberTokenInfo!.refreshToken.toString();
    } else {
      return '';
    }
  }

  /// 토큰 정보 업데이트
  void updateMemberTokenInfo(MemberTokenInfoDTO tokenInfo) async {
    var memberInfo = await findMemberInfo();
    memberInfo = memberInfo!.copyWith(memberTokenInfo: tokenInfo);
    updateMemberInfo(memberInfo);
  }

  /// 멤버 인증 상태 저장
  void updateConfirmState(bool isConfirm) async {
    var memberInfo = await findMemberInfo();
    memberInfo = memberInfo!.copyWith(isConfirmed: isConfirm);
    updateMemberInfo(memberInfo);
  }

  /// 멤버 id 조회
  Future<String?> findMemberUUID() async {
    var memberInfo = await findMemberInfo();
    if (memberInfo?.uuid != null) {
      return memberInfo!.uuid;
    } else {
      return '';
    }
  }

  /// 로그아웃 상태로 -> 앱 pref 정보 전체 삭제
  Future setLogoutState() async {
    var pref = await _pref;
    pref.clear();
  }
}
