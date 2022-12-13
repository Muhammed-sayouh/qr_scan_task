import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qr_scan/services/login_service.dart';
import 'package:qr_scan/view_model/login_view_model.dart';

import '../services/scan_service.dart';
import '../view_model/qr_scan_result_view_model.dart';
import '../view_model/scan_qr_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => LoginViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => LoginService(),
  ),
  ChangeNotifierProvider(
    create: (context) => ScanQrCodeViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => QrResultViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => ScanService(),
  ),
];
