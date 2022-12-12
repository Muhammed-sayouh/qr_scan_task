import 'package:dio/dio.dart' as dio_package;

import '../../helpers/dio/dio.dart';
import '../models/codes_model.dart';

Future<List<Datum>> getCodes() async {
  try {
    dio_package.Response response = await dio().get('my-codes',
        options: dio_package.Options(
            contentType: dio_package.Headers.formUrlEncodedContentType));
    return codesModelFromJson(response.data).data;
  } catch (err) {
    return [];
  }
}
