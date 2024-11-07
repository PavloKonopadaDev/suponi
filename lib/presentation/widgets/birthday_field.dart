// lib/presentation/widgets/birthday_field.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BirthdayInputField extends StatelessWidget {
  final String label;
  final double width;
  final int maxLength;
  final Function(String) onChanged;
  final bool isValid;

  const BirthdayInputField({
    Key? key,
    required this.label,
    required this.width,
    required this.maxLength,
    required this.onChanged,
    this.isValid = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: 67,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: isValid ? const Color(0xFF959595) : Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: TextField(
              keyboardType: TextInputType.number,
              maxLength: maxLength,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
              onChanged: onChanged,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(maxLength),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isValid ? const Color(0xFF959595) : Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
