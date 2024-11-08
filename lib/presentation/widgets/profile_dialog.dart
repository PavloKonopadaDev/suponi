import 'package:flutter/material.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';

class ProfileDialog extends StatelessWidget {
  final String title;
  final String bodyText;
  final VoidCallback? onTap;

  const ProfileDialog({
    super.key,
    this.onTap,
    required this.title,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 245,
        width: 265,
        decoration: BoxDecoration(
          color: ColorName.black,
          border: Border.all(color: ColorName.silver, width: 1.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: AlertDialog(
          backgroundColor: ColorName.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                bodyText,
                style: const TextStyle(
                  color: ColorName.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorName.silver,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    if (onTap != null) {
                      onTap!();
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      color: ColorName.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
