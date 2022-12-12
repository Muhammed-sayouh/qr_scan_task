import 'package:flutter/material.dart';

import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? Function(String?)? validator;
  void Function(String)? onChanged;
  final bool obscureText;
    final TextEditingController? controller;

  CustomTextFormField(
      {Key? key,
      required this.hint,
      this.textInputType,
      this.maxLines = 1,
      this.obscureText = false,
      this.onChanged,
      this.validator, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      cursorColor: AppColors.mainDarkColor,
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
              horizontal: width(context, 0.03),
              vertical: height(context, 0.015))),
    );
  }
}

class CustomTextFormFieldNoBorder extends StatelessWidget {
  final String hint;
  final TextInputType? textInputType;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormFieldNoBorder(
      {Key? key,
      required this.hint,
      this.textInputType,
      this.maxLines = 1,
      this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: AppColors.mainDarkColor,
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
              horizontal: width(context, 0.03),
              vertical: height(context, 0.015))),
    );
  }
}

// ignore: must_be_immutable
class CustomTextFormFieldWithSuffix extends StatelessWidget {
  final String hint;
  final TextInputType? textInputType;
  final int? maxLines;
  final void Function()? onTap;
  final bool readOnly;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  void Function(String)? onChanged;
  final bool obscureText;
  CustomTextFormFieldWithSuffix(
      {Key? key,
      required this.hint,
      this.textInputType,
      this.maxLines = 1,
      this.onTap,
      this.controller,
      this.readOnly = false,
      this.suffix,
      this.obscureText = false,
      this.onChanged,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // enabled:enabled ,
      enableInteractiveSelection: false,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      readOnly: readOnly,
      controller: controller,
      cursorColor: AppColors.mainDarkColor,
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 50,
            maxWidth: 50,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(onTap: onTap, child: suffix),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: width(context, 0.03),
              vertical: height(context, 0.015))),
    );
  }
}
