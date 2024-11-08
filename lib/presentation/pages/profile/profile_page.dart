import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';
import 'package:suppose_test_task/presentation/logic/profile/profile_notifier.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/circle_top_button.dart';
import 'package:suppose_test_task/presentation/widgets/profile_container.dart';
import 'package:suppose_test_task/presentation/widgets/profile_dialog.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    final profileNotifier = ref.read(profileProvider.notifier);

    return Scaffold(
      backgroundColor: ColorName.black,
      appBar: AppBar(
        backgroundColor: ColorName.transparent,
        elevation: 0,
        leading: CircleTopButton(
          onTap: () => AppRouter.router.go(RoutePath.photoPreview),
          iconInsideCircle: IconName.backIcon(
            color: ColorName.silver,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Settings",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: ColorName.white,
              ),
            ),
            const SizedBox(height: 8),
            ProfileSelectionContainer(
              firstLabel: profileState.isUnlocked ? null : "Unlock App",
              firstOnTap: () {
                _showUnlockDialog(context, profileNotifier.unlockApp);
              },
              secondLabel: "Rate Us",
              secondOnTap: () {
                _showRateUsDialog(context);
              },
            ),
            const SizedBox(height: 24),
            const Text(
              "My Account",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: ColorName.white,
              ),
            ),
            const SizedBox(height: 8),
            ProfileSelectionContainer(
              firstLabel: "UserName",
              firstValue: profileState.userName,
              secondLabel: "Birthday",
              secondValue: profileState.birthday,
            ),
          ],
        ),
      ),
    );
  }

  void _showRateUsDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const ProfileDialog(
          title: "Rate Us",
          bodyText: "Please rate our app.",
        );
      },
    );
  }

  void _showUnlockDialog(BuildContext context, VoidCallback unlockAppCallback) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProfileDialog(
          title: "Unlock App",
          bodyText: "Pressing OK will unlock the app.",
          onTap: unlockAppCallback,
        );
      },
    );
  }
}
