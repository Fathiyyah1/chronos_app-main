import 'dart:async';

import 'package:chronos/const.dart';
import 'package:chronos/models/transaction.dart';
import 'package:chronos/pages/add_transaction.dart';
import 'package:chronos/services/decrypt_qr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    print("RESULTS $result");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: size.width * .5,
            height: size.height * .5,
            child: Text(
              (result != null)
                  ? result!.code ?? ""
                  : "Please scan an invoice QR code",
              style: subTitleStyle,
            ),
          ),
          QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
        ],
      ),
    );
  }

  StreamSubscription? streamSubscription;
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    streamSubscription = controller.scannedDataStream.listen(
      (scanData) {
        streamSubscription!.cancel();
        Transaction? transaction = decryptQRJson(scanData.code ?? "");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AddExpensePage(
              transaction: transaction!,
              isScanned: true,
            ),
          ),
        );
      },
    );
  }
}

// class QRViewExampleState extends State<QRView> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: (result != null)
//                   ? Text(
//                       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//                   : Text('Scan a code'),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
