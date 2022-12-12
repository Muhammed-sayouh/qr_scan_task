import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../../helpers/dio/dio.dart';
import '../../helpers/exption.dart';

class LoginService with ChangeNotifier {
  bool loggedIn = false;
  Future<bool> loginService(
      {required String phone, required String password}) async {
    GetStorage storage = GetStorage();
    try {
      dio_package.Response response = await dio().post('login-scanner',
          data: {"phone": phone, "password": password},
          options: dio_package.Options(
              contentType: dio_package.Headers.formUrlEncodedContentType));


      if (response.data['status'] == 0) {
        loggedIn = false;

        throw HttpExeption(response.data['massage']);
      }
      if (response.data['status'] == 1) {
        loggedIn = true;

        storage.write(
          'info',
          response.data,
        );
        
      }

      notifyListeners();
      return loggedIn;
    } catch (error) {
      rethrow;
    }
  }
}
