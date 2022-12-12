import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

class CodeItems extends StatelessWidget {
  final String code ;
  const CodeItems({
    Key? key, required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: height(context, 0.08),
        padding:
            EdgeInsets.only(left: width(context, 0.08)),
        decoration: BoxDecoration(
          color: AppColors.darkWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          SizedBox(
             width: width(context, 0.08),
            child: Image.asset(Constants.peaperImage)),
         SizedBox(width: width(context, 0.05),),
          Text(
           code,
            style: smallBlackFont(),
          )
        ]),
      ),
    );
  }
}
