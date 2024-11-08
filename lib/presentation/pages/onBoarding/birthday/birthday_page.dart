import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';
import 'package:suppose_test_task/presentation/logic/birthday/birthday_notifier.dart';
import 'package:suppose_test_task/presentation/logic/birthday/birthday_state.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/reusable_canvas.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';
import 'package:suppose_test_task/presentation/widgets/birthday_field.dart';
import 'package:suppose_test_task/presentation/widgets/divided_background_image.dart';

class BirthdayPage extends ConsumerStatefulWidget {
  const BirthdayPage({super.key});

  @override
  ConsumerState<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends ConsumerState<BirthdayPage> {
  late TextEditingController dayController;
  late TextEditingController monthController;
  late TextEditingController yearController;

  @override
  void initState() {
    super.initState();
    final birthdayState = ref.read(birthdayProvider);
    dayController = TextEditingController(text: birthdayState.day);
    monthController = TextEditingController(text: birthdayState.month);
    yearController = TextEditingController(text: birthdayState.year);
  }

  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final birthdayState = ref.watch(birthdayProvider);
    final birthdayNotifier = ref.read(birthdayProvider.notifier);

    ref.listen<BirthdayState>(birthdayProvider, (previous, next) {
      if (next.day != dayController.text) {
        dayController.text = next.day;
      }
      if (next.month != monthController.text) {
        monthController.text = next.month;
      }
      if (next.year != yearController.text) {
        yearController.text = next.year;
      }
    });

    return Stack(
      children: [
        const PartialImageBackground(
          startFraction: 0.0,
          endFraction: 0.25,
        ),
        CustomPage(
          progressPercentage: 25.0,
          leadingIcon: IconName.closeIcon(
            color: ColorName.silver,
          ),
          onLeadingPressed: () {
            context.go('/onboarding');
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "When’s\nyour birthday?",
                style: TextStyle(
                  color: ColorName.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 58),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BirthdayInputField(
                    label: "Day",
                    width: 74,
                    maxLength: 2,
                    isValid: birthdayState.dayValid,
                    controller: dayController,
                    onChanged: (value) {
                      birthdayNotifier.setDay(value);
                    },
                  ),
                  const SizedBox(width: 16),
                  BirthdayInputField(
                    label: "Month",
                    width: 74,
                    maxLength: 2,
                    isValid: birthdayState.monthValid,
                    controller: monthController,
                    onChanged: (value) {
                      birthdayNotifier.setMonth(value);
                    },
                  ),
                  const SizedBox(width: 16),
                  BirthdayInputField(
                    label: "Year",
                    width: 103,
                    maxLength: 4,
                    isValid: birthdayState.yearValid,
                    controller: yearController,
                    onChanged: (value) {
                      birthdayNotifier.setYear(value);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
          showFab: true,
          onFabPressed: (birthdayState.isValid && !birthdayState.isLoading)
              ? () {
                  birthdayNotifier.saveBirthday();
                }
              : null,
          fabChild: birthdayState.isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ColorName.white),
                  strokeWidth: 2,
                )
              : IconName.forwardIcon(),
        ),
      ],
    );
  }
}
