import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewScreen extends StatefulWidget {
  final GlobalKey qrKey;
  final Function onQRViewCreated;

  QRViewScreen({Key? key, required this.qrKey, required this.onQRViewCreated})
      : super(key: key);

  @override
  _QRViewScreenState createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {
  late QRViewController _controller;
  String qrText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: widget.qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(qrText),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: TextButton(
                onPressed: () {
                  if (_controller != null) {
                    _controller.dispose();
                  }
                  Navigator.pop(context);
                },
                child: Text("Close"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    if (widget.onQRViewCreated != null) {
      widget.onQRViewCreated(controller);
    }
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData as String;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
