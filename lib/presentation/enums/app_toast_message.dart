import 'package:flutter/material.dart';

enum AppToastMessage {
  custom;

  String get title {
    switch (this) {
      case AppToastMessage.custom:
        return '';
    }
  }

  String get errorWidgetTitle {
    switch (this) {
      case AppToastMessage.custom:
        return '';
    }
  }

  String get subtitle {
    switch (this) {
      case AppToastMessage.custom:
        return '';
    }
  }

  Widget get icon {
    switch (this) {
      case AppToastMessage.custom:
        return const SizedBox.shrink();
    }
  }

  Color? get backGroundColor {
    switch (this) {
      case AppToastMessage.custom:
        return Colors.red[300];
    }
  }
}
