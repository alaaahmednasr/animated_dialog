// ignore_for_file: must_be_immutable

library animated_dialog;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimatedDialog extends StatelessWidget {
  BuildContext context;
  String dialogAnimatedIconPath;
  String dialogContentText;
  String mainButtonText;
  String additionalButtonText;
  bool needTwoButtons;
  bool needMainButtonOutline;
  bool needAdditionalButtonOutline;
  Color mainButtonBackgroundColor;
  Color mainButtonBorderColor;
  Color mainButtonTextColor;
  Color additionalButtonBackgroundColor;
  Color additionalButtonBorderColor;
  Color additionalButtonTextColor;
  Color dialogContentTextColor ;
  double dialogContentTextFontSize ;
  FontWeight dialogContentTextFontWeight;
  void Function() mainButtonOnPressed;
  void Function()? additionalButtonOnPressed;
  CustomAnimatedDialog({
    super.key,
    required this.context,
    required this.dialogAnimatedIconPath,
    required this.dialogContentText,
    required this.mainButtonText,
    this.additionalButtonText = '',
    this.needTwoButtons = false,
    this.needMainButtonOutline = false,
    this.needAdditionalButtonOutline = false,
    this.mainButtonBackgroundColor = Colors.black,
    this.mainButtonBorderColor = Colors.black,
    this.mainButtonTextColor = Colors.white,
    this.additionalButtonBackgroundColor = Colors.black,
    this.additionalButtonBorderColor = Colors.black,
    this.additionalButtonTextColor = Colors.white,
    this.dialogContentTextColor = Colors.black,
    this.dialogContentTextFontSize = 18,
    this.dialogContentTextFontWeight = FontWeight.w600,
    required this.mainButtonOnPressed,
    this.additionalButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black.withOpacity(0.1),
      actionsAlignment: MainAxisAlignment.center,
      title: _dialogAnimatedIcon(
        context: context,
        dialogAnimatedIconPath: dialogAnimatedIconPath,
      ),
      content: _dialogContent(
        dialogContentText: dialogContentText,
        dialogContentTextFontSize: dialogContentTextFontSize,
        dialogContentTextColor: dialogContentTextColor,
        dialogContentTextFontWeight: dialogContentTextFontWeight,
      ),
      actions: _dialogActions(
        context: context,
        mainButtonText: mainButtonText,
        mainButtonOnPressed: mainButtonOnPressed,
        mainButtonBackgroundColor: mainButtonBackgroundColor,
        mainButtonBorderColor: mainButtonBorderColor,
        mainButtonTextColor: mainButtonTextColor,
        needMainButtonOutline: needMainButtonOutline,
        additionalButtonBackgroundColor: additionalButtonBackgroundColor,
        additionalButtonBorderColor: additionalButtonBorderColor,
        additionalButtonOnPressed: additionalButtonOnPressed!,
        additionalButtonText: additionalButtonText,
        additionalButtonTextColor: additionalButtonTextColor,
        needAdditionalButtonOutline: needAdditionalButtonOutline,
        needTwoButtons: needTwoButtons,
      ),
    );
  }

  static Widget _dialogAnimatedIcon({
    required BuildContext context,
    required String dialogAnimatedIconPath,
  }) {
    return Column(
      children: [
        Lottie.asset(
          dialogAnimatedIconPath,
          width: 150,
          height: 150,
        ),
      ],
    );
  }

  static Widget _dialogContent({
    required String dialogContentText,
    required double dialogContentTextFontSize,
    required Color dialogContentTextColor,
    required FontWeight dialogContentTextFontWeight,
    int maxLines = 2,
  }) {
    return Text(
      dialogContentText,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: dialogContentTextColor,
        fontSize: dialogContentTextFontSize,
        fontWeight: dialogContentTextFontWeight,
      ),
    );
  }

  static List<Widget>? _dialogActions({
    required BuildContext context,
    required String mainButtonText,
    required void Function() mainButtonOnPressed,
    required needMainButtonOutline,
    required Color mainButtonBackgroundColor,
    required Color mainButtonBorderColor,
    required Color mainButtonTextColor,
    required bool needTwoButtons,
    required String additionalButtonText,
    required void Function() additionalButtonOnPressed,
    required needAdditionalButtonOutline,
    required Color additionalButtonBackgroundColor,
    required Color additionalButtonBorderColor,
    required Color additionalButtonTextColor,
  }) {
    return <Widget>[
      Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 15,
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    surfaceTintColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    backgroundColor: needMainButtonOutline
                        ? Colors.white
                        : mainButtonBackgroundColor,
                    side: BorderSide(
                      color: needMainButtonOutline
                          ? mainButtonBorderColor
                          : Colors.transparent,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: mainButtonOnPressed,
                  child: Text(
                    mainButtonText,
                    style: TextStyle(
                      color: mainButtonTextColor,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: needTwoButtons,
              child: const SizedBox(
                width: 20,
              ),
            ),
            Visibility(
              visible: needTwoButtons,
              child: Expanded(
                child: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      backgroundColor: needAdditionalButtonOutline
                          ? Colors.white
                          : additionalButtonBackgroundColor,
                      side: BorderSide(
                        color: needAdditionalButtonOutline
                            ? additionalButtonBorderColor
                            : Colors.transparent,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: additionalButtonOnPressed,
                    child: Text(
                      additionalButtonText,
                      style: TextStyle(
                        color: additionalButtonTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
