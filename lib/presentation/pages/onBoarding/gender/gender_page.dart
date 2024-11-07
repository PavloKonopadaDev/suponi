// lib/presentation/pages/gender/gender_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/presentation/logic/gender/gender_notifier.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/reusable_canvas.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/gender_selection_button.dart';

class GenderPage extends ConsumerWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderState = ref.watch(genderProvider);
    final genderNotifier = ref.read(genderProvider.notifier);

    return CustomPage(
      progressPercentage: 75.0,
      leadingIcon: const Icon(
        Icons.arrow_back,
        color: Color(0xFF959595),
      ),
      onLeadingPressed: () {
        AppRouter.router.go(RoutePath.nickname);
      },
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Text(
            "Which gender do.\nyou identify as?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 14),
          const Text(
            "Your gender helps us find the\nright matches for you.",
            style: TextStyle(
              color: Color(0xFFA6A6A6),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 30),
          GenderSelectionButton(
            label: "Male",
            isSelected: genderState.selectedGender == "Male",
            onTap: () {
              genderNotifier.selectGender("Male");
              genderNotifier.saveGender();
            },
          ),
          const SizedBox(height: 16),
          GenderSelectionButton(
            label: "Female",
            isSelected: genderState.selectedGender == "Female",
            onTap: () {
              genderNotifier.selectGender("Female");
              genderNotifier.saveGender();
            },
          ),
          const SizedBox(height: 16),
          GenderSelectionButton(
            label: "Other",
            isSelected: genderState.selectedGender == "Other",
            onTap: () {
              genderNotifier.selectGender("Other");
              genderNotifier.saveGender();
            },
          ),
        ],
      ),
      showFab: false,
    );
  }
}
