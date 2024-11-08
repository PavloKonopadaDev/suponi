import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';
import 'package:suppose_test_task/presentation/logic/gender/gender_notifier.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/reusable_canvas.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/divided_background_image.dart';
import 'package:suppose_test_task/presentation/widgets/gender_selection_button.dart';

class GenderPage extends ConsumerWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderState = ref.watch(genderProvider);
    final genderNotifier = ref.read(genderProvider.notifier);

    return Stack(
      children: [
        const PartialImageBackground(
          startFraction: 0.5,
          endFraction: 0.75,
        ),
        CustomPage(
          progressPercentage: 75.0,
          leadingIcon: IconName.backIcon(
            color: ColorName.silver,
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
                  color: ColorName.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 14),
              const Text(
                "Your gender helps us find the\nright matches for you.",
                style: TextStyle(
                  color: ColorName.silverSub,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
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
        ),
      ],
    );
  }
}
