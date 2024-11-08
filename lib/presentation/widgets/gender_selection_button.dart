import 'package:flutter/material.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';

class GenderSelectionButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderSelectionButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343,
        height: 67,
        decoration: BoxDecoration(
          color: isSelected ? ColorName.transparentWhite.withOpacity(0.2) : ColorName.transparent,
          border: Border.all(
            color: ColorName.silver,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: ColorName.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
