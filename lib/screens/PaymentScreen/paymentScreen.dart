import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'components/QrView.dart';

class QrScannerContainer extends StatefulWidget {
  @override
  _QrScannerContainerState createState() => _QrScannerContainerState();
}

class _QrScannerContainerState extends State<QrScannerContainer> {
  GlobalKey qrKey = GlobalKey();
  late QRViewController controller;
  String qrText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.camera_alt,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRViewScreen(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    qrKey: qrKey,
                  ),
                ),
              );
            },
            child: Text("Scan QR Code"),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData as String;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
