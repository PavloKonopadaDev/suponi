import 'package:flutter/material.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';

class PartialImageBackground extends StatelessWidget {
  final double startFraction;
  final double endFraction;

  const PartialImageBackground({
    super.key,
    required this.startFraction,
    required this.endFraction,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned.fill(
      child: ClipRect(
        child: OverflowBox(
          alignment: Alignment.centerLeft,
          minWidth: screenWidth * 4,
          maxWidth: screenWidth * 4,
          child: Transform.translate(
            offset: Offset(-screenWidth * startFraction * 4, 0),
            child: Image.asset(
              IconName.onboardingBackgroundImage,
              fit: BoxFit.cover,
              width: screenWidth * 4,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ),
    );
  }
}
