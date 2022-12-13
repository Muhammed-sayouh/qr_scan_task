import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/services/scan_service.dart';
import 'package:qr_scan/ui/custom_widgets/custome_toast.dart';

import '../helpers/exption.dart';
import '../ui/custom_widgets/dialogs.dart';

class ScanQrCodeViewModel with ChangeNotifier {
// to sent code
  Future<void> sentCode(BuildContext context, String code) async {
    log("message");
 loadingDialog(context);
    try {
      await Provider.of<ScanService>(context, listen: false)
          .sentCodeService(code: code);
      // ignore: use_build_context_synchronously
     Navigator.of(context).pop();
    } on HttpExeption catch (error) {
      customToast(error.message);
   Navigator.of(context).pop();
    } catch (error) {
      log(error.toString());
Navigator.of(context).pop();
    }
  }

// to scan code

  Future<void> scan(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FE7D55", "cancel", true, ScanMode.QR);
    if (barcodeScanRes == '-1') {
      customToast("QR is not scanned");
    } else {
      log(barcodeScanRes);
      // ignore: use_build_context_synchronously
      sentCode(context, barcodeScanRes);
    }
  }
}
