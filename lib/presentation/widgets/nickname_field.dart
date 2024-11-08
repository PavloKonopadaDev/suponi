import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';

class NicknameInputField extends StatelessWidget {
  final String? label;
  final double width;
  final int maxLength;
  final Function(String) onChanged;
  final bool isValid;
  final TextEditingController controller;

  const NicknameInputField({
    super.key,
    this.label,
    required this.width,
    required this.maxLength,
    required this.onChanged,
    required this.controller,
    this.isValid = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 67,
      decoration: BoxDecoration(
        color: ColorName.transparent,
        border: Border.all(
          color: isValid ? ColorName.silver : ColorName.errorDefault,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        maxLength: maxLength,
        style: const TextStyle(
          color: ColorName.white,
          fontSize: 25,
        ),
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          hintText: label ?? '',
          hintStyle: TextStyle(
            color: isValid ? ColorName.silver : ColorName.errorDefault,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        onChanged: onChanged,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_ ]')),
          LengthLimitingTextInputFormatter(maxLength),
        ],
      ),
    );
  }
}
