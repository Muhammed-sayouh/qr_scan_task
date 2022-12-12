import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/ui/screens/qr_code/qr_code_screen.dart';

import '../helpers/exption.dart';
import '../helpers/navigators.dart';
import '../services/login_service.dart';
import '../ui/custom_widgets/custome_toast.dart';
import '../ui/custom_widgets/dialogs.dart';

class LoginViewModel with ChangeNotifier {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isScure = true;

  void toggel() {
    isScure = !isScure;
    notifyListeners();
  }

  Future<void> submit(
    BuildContext context, {
    GlobalKey<FormState>? formKey,
  }) async {
    if (!formKey!.currentState!.validate()) {
      return;
    }
    loadingDialog(context);
    try {
      await Provider.of<LoginService>(context, listen: false)
          .loginService(password: password.text, phone: phone.text);

      // ignore: use_build_context_synchronously
      Navigators.getOffAll(context, const QrCodeScreen());
    } on HttpExeption catch (error) {
      customToast(error.message);
      Navigator.of(context).pop();
    } catch (error) {
      Navigator.of(context).pop();
    }
  }
}
