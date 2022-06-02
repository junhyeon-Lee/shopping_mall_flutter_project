import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_view_model.dart';

abstract class BaseView<T extends BaseViewModel> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key);

  /// overscroll never
  Widget disallowIndicatorScrollView(
      {required Widget child,
        ScrollController? controller,
        EdgeInsets? padding,
        Axis scrollDirection = Axis.vertical,
        bool reverse = false}) {
    return disallowIndicatorWidget(
      child: SingleChildScrollView(
          reverse: reverse, controller: controller, padding: padding, child: child, scrollDirection: scrollDirection),
    );
  }

  Widget disallowIndicatorWidget({required Widget child}) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }

  /// 기본 앱바 생성
  AppBar buildBaseAppBar(
      {required String title,
        TextStyle? textStyle,
        IconData? leadIcon = Icons.close,
        List<Widget>? actions,
        Function? onBackPress}) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: actions ?? [],
      elevation: 0,
      title: Text(title,
          style: textStyle ?? const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17)),
      centerTitle: true,
      leading: leadIcon == null
          ? Container()
          : GestureDetector(
          child: Icon(leadIcon, color: Colors.black),
          onTap: () {
            if (onBackPress == null) {
              Get.back();
            } else {
              onBackPress.call();
            }
          }),
      shape: const Border(bottom: BorderSide(color: Colors.black12)),
    );
  }

  /// 프로그래스
  Widget progressWidget({required Widget child}) {
    return Stack(children: [
      child,
      Obx(() {
        return controller.isProgress
            ? Container(
            child: const Center(child: CircularProgressIndicator()),
            decoration: const BoxDecoration(color: Colors.black12))
            : Container();
      }),
    ]);
  }

  /// 버튼
  Widget buildBottomButton({
    required String text,
    required bool isEnable,
    required Function? onPositiveTab,
    bool isBorder = false,
    String? negativeButtonText,
    Function? onNegativeTab,
  }) {
    Color buttonColor = Colors.grey;
    if (isEnable) buttonColor = Colors.blue;

    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: isBorder
          ? const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12, width: 1)), color: Colors.white)
          : const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          negativeButtonText != null && onNegativeTab != null
              ? Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              /// 지정 취소 버튼
              child: Text(negativeButtonText, style: const TextStyle(fontSize: 13, color: Colors.grey)),
              onTap: () => onNegativeTab(),
            ),
          )
              : Container(),
          GestureDetector(
            onTap: () => onPositiveTab != null ? onPositiveTab() : {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: buttonColor,
              ),
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                  child: Text(text,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 스낵바 출력
  showSnackBar(String content) {
    var snackBar = SnackBar(content: Text(content));
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  /// 다이얼로그 생성
  void showAlertDialog(
      {String? title,
        required String content,
        String positiveButtonText = "확인",
        String negativeBtnText = '취소',
        Color? positiveButtonColor = Colors.blue,
        Color negativeButtonColor = Colors.grey,
        Function? setOnPositiveListener,
        Function? setOnNegativeListener,
        bool barrierDismissible = true}) {
    showDialog(
        context: Get.context!,
        barrierDismissible: barrierDismissible, // Dialog 를 제외한 다른 화면 터치 x
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: title == null ? null : Column(children: [Text(title)]),
            content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(content)]),
            actions: <Widget>[
              TextButton(
                child: Text(negativeBtnText, style: TextStyle(color: negativeButtonColor)),
                onPressed: () {
                  setOnNegativeListener?.call();
                  Get.back();
                },
              ),
              TextButton(
                child: Text(positiveButtonText, style: TextStyle(color: positiveButtonColor)),
                onPressed: () {
                  setOnPositiveListener?.call();
                  Get.back();
                },
              ),
            ],
          );
        });
  }
}
