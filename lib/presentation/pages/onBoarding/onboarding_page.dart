import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';
import 'package:suppose_test_task/presentation/logic/onboarding/onboarding_notifier.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      backgroundColor: ColorName.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              IconName.firstScreenOnboarding,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 291,
        decoration: const BoxDecoration(
          color: ColorName.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Are you ready for\nyour test?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorName.white,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 11),
            const Text(
              "Start now by creating your profile and connect!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorName.silver,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onboardingState.hasLoading
                  ? null
                  : () {
                      onboardingNotifier.continueOnboarding();
                    },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(343, 50),
                backgroundColor: ColorName.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: onboardingState.hasLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(ColorName.black),
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      "Continue",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: ColorName.black,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
