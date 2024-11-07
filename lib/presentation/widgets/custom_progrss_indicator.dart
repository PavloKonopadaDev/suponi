import 'package:flutter/material.dart';

class LoadingIndicatorDialog {
  static final LoadingIndicatorDialog _singleton = LoadingIndicatorDialog._internal();
  late BuildContext _context;
  bool isDisplayed = false;

  factory LoadingIndicatorDialog() {
    return _singleton;
  }

  LoadingIndicatorDialog._internal();

  show(BuildContext context) {
    if (isDisplayed) {
      return;
    }
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          isDisplayed = true;
          return const PopScope(
            canPop: false,
            child: SimpleDialog(
              backgroundColor: Colors.transparent, //change to my file
              children: [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          );
        });
  }

  dismiss() {
    if (isDisplayed && _context.mounted) {
      Navigator.of(_context).pop();
      isDisplayed = false;
    }
  }
}
