import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class PaymentQRScanner extends StatefulWidget {
  @override
  _PaymentQRScannerState createState() => _PaymentQRScannerState();
}

class _PaymentQRScannerState extends State<PaymentQRScanner> {
  String _paymentDetails = '';
  String _barcode = '';

  Future _scanQR() async {
    _barcode = await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true, ScanMode.QR);

    setState(() {
      _paymentDetails = _barcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Payment Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _paymentDetails == ''
                  ? Text('Scan a QR code to capture payment details')
                  : Text(_paymentDetails),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: _scanQR,
            child: Text('Scan QR Code'),
          ),
        ],
      ),
    );
  }
}
