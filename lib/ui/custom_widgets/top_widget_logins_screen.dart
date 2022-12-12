import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/font_style.dart';

class LoginScreenTopWidget extends StatelessWidget {
  const LoginScreenTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 0.35),
      width: width(context, 1),
      child: Stack(
        children: [
          SizedBox(
              height: height(context, 0.25),
              child: Image.asset(
                Constants.circle2,
                fit: BoxFit.fill,
              ),),
          Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                  width: width(context, 0.5),
                  height: height(context, 0.25),
                  child: Image.asset(
                    Constants.circle1,
                    fit: BoxFit.fill,
                  ),),),
          Center(
            child: Text(
              Constants.signIn,
              style: titleStyle().copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
