import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../main.dart';

class QrCodeScanScreen2 extends StatefulWidget {
  const QrCodeScanScreen2({super.key});

  @override
  _QrCodeScanScreen2State createState() => _QrCodeScanScreen2State();
}

class _QrCodeScanScreen2State extends State<QrCodeScanScreen2> {
  late QRViewController _controller;
  // var _paymentDetails;
  bool _torchEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: GlobalKey(debugLabel: 'QR'),
            onQRViewCreated: _onQRViewCreated,
            cameraFacing: CameraFacing.back,
            overlay: QrScannerOverlayShape(
              borderColor: const Color.fromARGB(255, 207, 14, 0),
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 37),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: IconButton(
              icon: _torchEnabled
                  ? const Icon(Icons.flash_on, color: Colors.white, size: 37)
                  : const Icon(Icons.flash_off, color: Colors.white, size: 37),
              onPressed: () async {
                try {
                  _torchEnabled = !_torchEnabled;
                  await _controller.toggleFlash();
                  setState(() {});
                } on PlatformException catch (e) {
                  _torchEnabled = false;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _controller.scannedDataStream.listen((scanData) {
      final paymentProvider =
          Provider.of<PaymentProvider>(context, listen: false);
      paymentProvider.paymentDetails = scanData as String;
      // Navigator.pop(context, _paymentDetails);
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
