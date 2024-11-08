import 'package:flutter/material.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';

class PhotoSelectionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const PhotoSelectionButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorName.white,
        minimumSize: const Size(343, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: ColorName.black,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
