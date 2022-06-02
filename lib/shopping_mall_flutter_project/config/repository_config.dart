class RepositoryConfig {
  static int serverTimeDiff = 0;

  /// 서버 시간 차이 계산해서 현재 시간 계산
  static DateTime getCurrentTime() {
    return DateTime.now().subtract(Duration(milliseconds: serverTimeDiff));
  }

  // static const serverUrl = 'http://172.31.98.151:8080'; // 집 서버
  // static const serverWebSockUrl = 'ws://172.31.98.151:8080/websocket/invest';
  static const serverUrl = 'http://172.31.98.147:8001';
  static const basicToken = '아직 베이직 토큰이 없겠쥬 아마?';
}


