import 'package:flutter/material.dart';

import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final bool isBoldedText;
  final String title;
  final double widthRatio;
  final double hightRatio;
  final double elevation;
  final double borderRadius;
  final void Function()? onPressed;
  const CustomButton(
      {Key? key,
      this.backgroundColor = AppColors.mainColor,
      required this.title,
      this.widthRatio = 0.8,
      this.hightRatio = 0.07,
      this.textColor = Colors.white,
      this.isBoldedText = true,
      this.elevation = 0,
      this.onPressed,
      this.borderRadius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        enableFeedback: true,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shadowColor: MaterialStateProperty.all(AppColors.mainDarkColor),
        fixedSize: MaterialStateProperty.all(
          Size(
            width(context, widthRatio),
            height(context, hightRatio),
          ),
        ),
      ),
      child: Text(
        title,
        style: sBigBlackFont().copyWith(
            color: textColor,
            fontWeight: isBoldedText ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

