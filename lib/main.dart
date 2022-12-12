import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/helpers/porviders.dart';
import 'package:qr_scan/ui/screens/login/login_screen.dart';
import 'package:qr_scan/ui/theme/style/theme.dart';


void main() async {

  await GetStorage.init();
  HttpOverrides.global =  MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child:  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        home:  LoginScreen(),
      ),
    );
  }
  
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


