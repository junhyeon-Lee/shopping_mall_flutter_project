import 'package:flutter/material.dart';
import 'package:shopping_mall_flutter_project/shopping_mall_flutter_project/shopping_mall/presentation/common_widgets/app_appbars.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../data/entity/payment/payment_dto.dart';

class KcpPaymentView extends StatelessWidget {
  const KcpPaymentView({Key? key,
   required this.paymentData}) : super(key: key);

  final PaymentDTO paymentData;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: '결재하기'),
      body:  WebView(
        initialUrl:
        'http://172.31.98.151:8001/'
            'kcp_pay_form?'
            'productName=productName'
            '&totalPrice=10000'
            '&orderedMemberName=%EA%B9%80%EC%A4%80%ED%98%B8'
            '&orderedMemberPhoneNumber=01066286643'
            '&orderedMemberAdditionalPhoneNumber=01066286644'
            '&orderedMemberEmail=blac2013@gmail.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

//결재하기 페이지 이동
// Get.to(
// KcpPaymentView(
// paymentData: PaymentDTO(
// productName: 'productName',
// totalPrice: 10000,
// orderedMemberName: '%EA%B9%80%EC%A4%80%ED%98%B8',
// orderedMemberPhoneNumber: '01066286643',
// orderedMemberAdditionalPhoneNumber: '01066286644',
// orderedMemberEmail: 'blac2013@gmail.com',
// ),
// )
// );