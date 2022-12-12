import 'package:get_storage/get_storage.dart';

class GetStorageHelper {
  static String token() {
    GetStorage getStorage = GetStorage();
    String restaurantName;
    if (getStorage.read('info') == null) {
      return '';
    } else {
      restaurantName = getStorage.read('info')["data"]["token"] ?? '';
      return restaurantName;
    }
  }
}
