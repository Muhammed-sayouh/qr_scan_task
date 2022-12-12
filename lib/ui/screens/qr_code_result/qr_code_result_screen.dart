import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/helpers/constants.dart';
import 'package:qr_scan/helpers/navigators.dart';
import 'package:qr_scan/ui/custom_widgets/custom_button.dart';
import 'package:qr_scan/ui/custom_widgets/expanded_indecator.dart';
import 'package:qr_scan/ui/theme/sizes/sizes.dart';
import 'package:qr_scan/ui/theme/style/colors.dart';
import 'package:qr_scan/ui/theme/style/font_style.dart';
import 'package:qr_scan/view_model/qr_scan_result_view_model.dart';

import '../../custom_widgets/code_items_widget.dart';

class QrCodeRusltScreen extends StatefulWidget {
  const QrCodeRusltScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeRusltScreen> createState() => _QrCodeRusltScreenState();
}

class _QrCodeRusltScreenState extends State<QrCodeRusltScreen> {
  @override
  void initState() {
    Provider.of<QrResultViewModel>(context, listen: false).fetchCodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QrResultViewModel>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            width: width(context, 1),
            height: height(context, 1),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height(context, 0.88),
              width: width(context, 1),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width(context, 0.05)),
                child: Column(
                  children: [
                    const BigPadding(),
                    const ExpandEndecator(),
                    const SmallPadding(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: width(context, 0.08),
                        child: InkWell(
                          onTap: () => Navigators.back(context),
                          child: Image.asset(Constants.backScanImage),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.04),
                    ),
                    Text(
                      Constants.scanningResult,
                      style:
                          sBigBlackFont().copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: height(context, 0.025),
                    ),
                    SizedBox(
                      width: width(context, 0.6),
                      child: Text(
                        Constants.scanningResultText,
                        textAlign: TextAlign.center,
                        style: sSmallBlackFont().copyWith(
                          color: AppColors.lightGrayColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.025),
                    ),
                    provider.loader
                        ? const CupertinoActivityIndicator()
                        : Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width(context, 0.08)),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: provider.codes.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => CodeItems(
                                  code: provider.codes[index].code,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    CustomButton(title: Constants.send),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
