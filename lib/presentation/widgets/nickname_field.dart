// lib/presentation/widgets/nickname_field.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NicknameInputField extends StatelessWidget {
  final String? label;
  final double width;
  final int maxLength;
  final Function(String) onChanged;
  final bool isValid;

  const NicknameInputField({
    Key? key,
    this.label,
    required this.width,
    required this.maxLength,
    required this.onChanged,
    this.isValid = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 67,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: isValid ? const Color(0xFF959595) : Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        maxLength: maxLength,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Lato',
        ),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          hintText: label ?? '',
          hintStyle: TextStyle(
            color: isValid ? const Color(0xFF959595) : Colors.red,
            fontSize: 16,
            fontFamily: 'Lato',
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
