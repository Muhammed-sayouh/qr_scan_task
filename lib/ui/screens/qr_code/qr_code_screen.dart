import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/helpers/constants.dart';
import 'package:qr_scan/ui/custom_widgets/custom_button.dart';
import 'package:qr_scan/ui/custom_widgets/expanded_indecator.dart';
import 'package:qr_scan/ui/theme/sizes/sizes.dart';
import 'package:qr_scan/ui/theme/style/colors.dart';
import 'package:qr_scan/ui/theme/style/font_style.dart';

import '../../../helpers/navigators.dart';
import '../../../view_model/scan_qr_view_model.dart';
import '../qr_code_result/qr_code_result_screen.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScanQrCodeViewModel>(context);
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
                                onTap: () => Navigators.getTo(
                                    context, const QrCodeRusltScreen()),
                                child: Image.asset(Constants.itemsScanImage)))),
                    SizedBox(
                      height: height(context, 0.08),
                    ),
                    Text(
                      Constants.scanQrCode,
                      style:
                          sBigBlackFont().copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: height(context, 0.025),
                    ),
                    SizedBox(
                      width: width(context, 0.6),
                      child: Text(
                        Constants.plsScanQr,
                        textAlign: TextAlign.center,
                        style: sSmallBlackFont().copyWith(
                          color: AppColors.lightGrayColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.05),
                    ),
                    SizedBox(
                      child: Image.asset(Constants.qrImage),
                    ),
                    const BigPadding(),
                    Text(
                      Constants.scanningCode,
                      textAlign: TextAlign.center,
                      style: sSmallBlackFont().copyWith(
                        color: AppColors.lightGrayColor,
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.04),
                    ),
                    Image.asset(Constants.threeIconsIage),
                    SizedBox(
                      height: height(context, 0.06),
                    ),
                    CustomButton(
                      title: Constants.placeCameraCode,
                      onPressed: () => provider.scan(context),
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
