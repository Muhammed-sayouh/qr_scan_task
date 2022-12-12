import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:qr_scan/services/packages_service.dart';

import '../models/codes_model.dart';

class QrResultViewModel with ChangeNotifier {
  List<Datum> codes = [];
  bool loader = false;

  Future<void> fetchCodes() async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    loader = true;
    try {
      codes = await getCodes();
      log(codes.length.toString());
      loader = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
