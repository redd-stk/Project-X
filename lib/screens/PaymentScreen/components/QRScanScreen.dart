import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QrCodeScanScreen2 extends StatefulWidget {
  const QrCodeScanScreen2({super.key});

  @override
  _QrCodeScanScreen2State createState() => _QrCodeScanScreen2State();
}

class _QrCodeScanScreen2State extends State<QrCodeScanScreen2> {
  late QRViewController _controller;
  var _paymentDetails;
  bool _torchEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: _torchEnabled ? Icon(Icons.flash_on) : Icon(Icons.flash_off),
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
        ],
      ),
      body: QRView(
        key: GlobalKey(debugLabel: 'QR'),
        onQRViewCreated: _onQRViewCreated,
        cameraFacing: CameraFacing.back,
        overlay: QrScannerOverlayShape(
          borderColor: Color.fromARGB(255, 207, 14, 0),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _controller.scannedDataStream.listen((scanData) {
      _paymentDetails = scanData;
      Navigator.pop(context, _paymentDetails);
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
