import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/cupertino.dart';
import 'package:qr_scan/ui/custom_widgets/custome_toast.dart';

import '../../helpers/dio/dio.dart';
import '../../helpers/exption.dart';
import '../helpers/constants.dart';

class ScanService with ChangeNotifier {
  bool scanned = false;
  Future<bool> sentCodeService({required String code}) async {
    try {
      dio_package.Response response = await dio().post('scan',
          data: {"code": code},
          options: dio_package.Options(
              contentType: dio_package.Headers.formUrlEncodedContentType));

      if (response.data['status'] == 0) {
        scanned = false;

        throw HttpExeption(response.data['massage']);
      }
      if (response.data['status'] == 1) {
        scanned = true;
        customToast(response.data['massage']);
      }

      notifyListeners();
      return scanned;
    } catch (error) {
      customToast(Constants.checkYourInternet);
      rethrow;
    }
  }
}
