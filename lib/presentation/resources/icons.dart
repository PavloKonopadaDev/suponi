import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suppose_test_task/generated/assets/assets.gen.dart';

class IconName {
  IconName._();

  //images
  static const firstScreenOnboarding = 'assets/images/onboarding_image.png';
  static const onboardingBackgroundImage = 'assets/images/onboarding_background_image.jpg';

  //icons
  static gearIcon({double? width, double? height, Color? color}) => SvgPicture.asset(
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        width: width,
        height: height,
        IconAssets.icons.gearIcon,
        fit: BoxFit.scaleDown,
      );

  static revertCameraIcon({double? width, double? height, Color? color}) => SvgPicture.asset(
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        width: width,
        height: height,
        IconAssets.icons.revertCameraIcon,
        fit: BoxFit.scaleDown,
      );
  static forwardIcon({double? width, double? height, Color? color}) => SvgPicture.asset(
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        width: width,
        height: height,
        IconAssets.icons.forwardIcon,
        fit: BoxFit.scaleDown,
      );
  static backIcon({double? width, double? height, Color? color}) => SvgPicture.asset(
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        width: width,
        height: height,
        IconAssets.icons.backIcon,
        fit: BoxFit.scaleDown,
      );
  static checkIcon({double? width, double? height, Color? color}) => SvgPicture.asset(
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        width: width,
        height: height,
        IconAssets.icons.checkIcon,
        fit: BoxFit.scaleDown,
      );
  static closeIcon({double? width, double? height, Color? color}) => SvgPicture.asset(
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        width: width,
        height: height,
        IconAssets.icons.closeIcon,
        fit: BoxFit.scaleDown,
      );
}
