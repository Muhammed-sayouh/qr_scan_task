import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/helpers/constants.dart';
import 'package:qr_scan/helpers/validations.dart';
import 'package:qr_scan/ui/custom_widgets/custom_button.dart';
import 'package:qr_scan/ui/custom_widgets/custom_text_form.dart';
import 'package:qr_scan/ui/theme/sizes/sizes.dart';
import 'package:qr_scan/ui/theme/style/colors.dart';
import 'package:qr_scan/ui/theme/style/font_style.dart';
import 'package:qr_scan/view_model/login_view_model.dart';

import '../../custom_widgets/top_widget_logins_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginScreenTopWidget(),
            SizedBox(
              height: height(context, 0.05),
            ),
            Padding(
              padding: commonPaddingHorizental(context),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hint: Constants.phone,
                      controller: provider.phone,
                      validator: (val) =>
                          Validations.validationrequiredField(val!),
                    ),
                    const BigPadding(),
                    CustomTextFormFieldWithSuffix(
                      hint: Constants.password,
                      controller: provider.password,
                      obscureText: provider.isScure,
                      validator: (val) => Validations.validationPassword(val!),
                      suffix: InkWell(
                        onTap: () => provider.toggel(),
                        child: Icon(
                          provider.isScure
                              ? CupertinoIcons.eye_fill
                              : CupertinoIcons.eye_slash_fill,
                          size: 22,
                        ),
                      ),
                    ),
                    const BigPadding(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(Constants.foretPassword,
                          style: mediumBlackFont().copyWith(
                              color: AppColors.grayColor,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: height(context, 0.05),
                    ),
                    CustomButton(
                      title: Constants.signIn,
                      onPressed: () {
                       
                        provider.submit(context, formKey: formKey);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
