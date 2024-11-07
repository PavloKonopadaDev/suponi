// lib/presentation/pages/birthday/birthday_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/presentation/logic/birthday/birthday_notifier.dart';
import 'package:suppose_test_task/presentation/logic/birthday/birthday_state.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/reusable_canvas.dart';
import 'package:suppose_test_task/presentation/widgets/birthday_field.dart';
import 'package:suppose_test_task/data/modela/user_model.dart'; // Переконайтеся, що шлях правильний
import 'package:hive/hive.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';

final birthdayProvider = StateNotifierProvider<BirthdayNotifier, BirthdayState>(
  (ref) {
    final localDataSource = getIt<LocalDataSource>();
    final userBox = Hive.box<User>('users');
    final eventBus = getIt<EventBus>();
    return BirthdayNotifier(localDataSource, userBox, eventBus);
  },
);

class BirthdayPage extends ConsumerWidget {
  const BirthdayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final birthdayState = ref.watch(birthdayProvider);
    final birthdayNotifier = ref.read(birthdayProvider.notifier);

    return CustomPage(
      progressPercentage: 25.0,
      leadingIcon: const Icon(
        Icons.close,
        color: Color(0xFF959595),
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
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 58),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Day
              BirthdayInputField(
                label: "Day",
                width: 74,
                maxLength: 2,
                isValid: birthdayState.dayValid,
                onChanged: (value) {
                  birthdayNotifier.setDay(value);
                },
              ),
              const SizedBox(width: 16),
              // Month
              BirthdayInputField(
                label: "Month",
                width: 74,
                maxLength: 2,
                isValid: birthdayState.monthValid,
                onChanged: (value) {
                  birthdayNotifier.setMonth(value);
                },
              ),
              const SizedBox(width: 16),
              // Year
              BirthdayInputField(
                label: "Year",
                width: 103,
                maxLength: 4,
                isValid: birthdayState.yearValid,
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
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            )
          : const Icon(Icons.arrow_forward),
    );
  }
}
