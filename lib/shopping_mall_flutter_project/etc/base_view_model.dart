import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shopping_mall/domain/model/page_request_model.dart';


class BaseViewModel extends GetxController {
  bool get isProgress => _isProgress.value;
  final RxBool _isProgress = false.obs;

  /// 프로그래스 출력
  void showProgress(bool progress) {
    if (progress) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    _isProgress(progress);
  }

  /// 스낵바 출력
  void showSnackBarByMessage({String message = '잠시 후 다시 시도해 주세요.'}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
  }

  /// 둥근 스낵바 출력
  void showRoundSnackBar({String message = '잠시 후 다시 시도해 주세요.'}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            )),
        backgroundColor: Colors.black.withOpacity(0.5),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
      ),
    );
  }

  /// 스크롤 하단에 닿으면 페이징
  void setPaginationScroll(ScrollController controller, PageRequestModel pageRequest, Function request) {
    controller.addListener(() {
      if (pageRequest.isLast) return;
      if (controller.position.extentAfter <= 10 && pageRequest.isLoading == false) {
        // print('하단 = ' + controller.position.extentAfter.toString());
        request.call();
      }
    });
  }
}
