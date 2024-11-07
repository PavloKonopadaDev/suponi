// lib/presentation/widgets/custom_page.dart

import 'package:flutter/material.dart';
import 'package:suppose_test_task/presentation/widgets/custom_indicator.dart';

class CustomPage extends StatelessWidget {
  final Widget body;
  final double progressPercentage;
  final Widget leadingIcon;
  final VoidCallback? onLeadingPressed;
  final bool showFab;
  final VoidCallback? onFabPressed;
  final Widget? fabChild;

  const CustomPage({
    super.key,
    required this.body,
    required this.progressPercentage,
    required this.leadingIcon,
    this.onLeadingPressed,
    this.showFab = true,
    this.onFabPressed,
    this.fabChild,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFabActive = onFabPressed != null;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: onLeadingPressed ??
              () {
                Navigator.of(context).pop();
              },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF959595),
                width: 1.0,
              ),
            ),
            child: Center(
              child: leadingIcon,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CustomProgressIndicator(
              size: 44,
              strokeWidth: 2,
              percentage: progressPercentage,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: body,
          ),
        ),
      ),
      floatingActionButton: showFab
          ? Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: ElevatedButton(
                  onPressed: onFabPressed,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.white;
                      },
                    ),
                    padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                      const CircleBorder(),
                    ),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: isFabActive ? const Color(0xFF959595) : const Color(0xFF757575),
                      size: 30,
                    ),
                  ),
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
