import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scan/ui/custom_widgets/custome_toast.dart';
import 'package:qr_scan/ui/screens/qr_code_result/qr_code_result_screen.dart';

import '../helpers/navigators.dart';

class ScanQrCodeViewModel with ChangeNotifier {
  Future<void> scan(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#FE7D55", "cancel", true, ScanMode.QR);
    if (barcodeScanRes == '-1') {
      customToast("QR is not scanned");
    } else {
      // ignore: use_build_context_synchronously
      Navigators.getTo(context, const QrCodeRusltScreen());
    }
  }
}
