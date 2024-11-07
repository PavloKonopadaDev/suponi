// lib/presentation/widgets/gender_selection_button.dart

import 'package:flutter/material.dart';

class GenderSelectionButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderSelectionButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343,
        height: 67,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF757575).withOpacity(0.2) : Colors.transparent,
          border: Border.all(
            color: isSelected ? const Color(0xFF959595) : const Color(0xFF959595),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
