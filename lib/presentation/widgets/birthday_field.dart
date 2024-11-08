import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';

class BirthdayInputField extends StatefulWidget {
  final String label;
  final double width;
  final int maxLength;
  final Function(String) onChanged;
  final bool isValid;
  final TextEditingController controller;

  const BirthdayInputField({
    super.key,
    required this.label,
    required this.width,
    required this.maxLength,
    required this.onChanged,
    required this.controller,
    this.isValid = true,
  });

  @override
  _BirthdayInputFieldState createState() => _BirthdayInputFieldState();
}

class _BirthdayInputFieldState extends State<BirthdayInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width,
          height: 67,
          decoration: BoxDecoration(
            color: ColorName.transparent,
            border: Border.all(
              color: widget.isValid ? ColorName.silver : ColorName.errorDefault,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              maxLength: widget.maxLength,
              style: const TextStyle(
                color: ColorName.white,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
              onChanged: widget.onChanged,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(widget.maxLength),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.label,
          style: TextStyle(
            color: widget.isValid ? ColorName.silver : ColorName.errorDefault,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
