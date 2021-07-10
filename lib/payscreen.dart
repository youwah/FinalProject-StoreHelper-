// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:storehelper/user.dart';
// import 'package:webview_flutter/webview_flutter.dart';


// class PayScreen extends StatefulWidget {
//   final User user;
//   final double total;

//   const PayScreen({Key key,  this.user, this.total }) : super(key: key);

//   @override
//   _PayScreenState createState() => _PayScreenState();
// }

// class _PayScreenState extends State<PayScreen> {
//   Completer<WebViewController> _controller = Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Center(
//         child: Container(
//           child: Column(
//             children: [
//               Expanded(
//                 child: WebView(
//                   initialUrl:
//                       'https://crimsonwebs.com/s272043/storehelper/php/billgenerate.php?email=' +
//                           widget.user.email +
//                           '&mobile=' +
//                           widget.user.phone +
//                           '&name=' +
//                           widget.user.name +
//                           '&amount=' +
//                           widget.total.toString(),
//                   javascriptMode: JavascriptMode.unrestricted,
//                   onWebViewCreated: (WebViewController webViewController) {
//                     _controller.complete(webViewController);
//                   },
//                 ),
//               )
//             ],    
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:storehelper/order.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'historyscreen.dart';
import 'user.dart';

class PayScreen extends StatefulWidget {
  final User user;
  final double total;
   final Order order;

  const PayScreen({Key key,  this.user, this.total, this.order}) : super(key: key);

  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
                leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(
                   builder: (BuildContext context) => PaymentHistoryScreen(
                     user: widget.user,
                   )));
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: WebView(
                  initialUrl:
                   //   'https://slumberjer.com/myshopweb/mobile/generate_bill.php?email=' +
                        'https://crimsonwebs.com/s272043/storehelper/php/billgenerate.php?email=' +
                          widget.user.email +
                          '&mobile=' +
                          //widget.user.phone +
                          widget.order.phone +
                          '&name=' +
                        //  widget.user.name +
                          widget.order.name +
                          '&amount=' +
                          widget.total.toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}