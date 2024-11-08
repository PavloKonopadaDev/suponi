import 'package:flutter/material.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';

class CircleTopButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? widthButton;
  final double? heightButton;
  final Color? colorOfBorder;
  final Widget iconInsideCircle;
  final Color? iconColor;
  const CircleTopButton({
    super.key,
    required this.onTap,
    this.widthButton,
    this.heightButton,
    this.colorOfBorder,
    required this.iconInsideCircle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heightButton ?? 44,
        width: widthButton ?? 44,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: ColorName.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: colorOfBorder ?? ColorName.lightWhite,
            width: 1.0,
          ),
        ),
        child: Center(
          child: iconInsideCircle,
        ),
      ),
    );
  }
}
