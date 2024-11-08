import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';
import 'package:suppose_test_task/presentation/logic/nickname/nick_name_notifier.dart';
import 'package:suppose_test_task/presentation/logic/nickname/nickname_state.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/reusable_canvas.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/divided_background_image.dart';
import 'package:suppose_test_task/presentation/widgets/nickname_field.dart';

class NicknamePage extends ConsumerStatefulWidget {
  const NicknamePage({super.key});

  @override
  ConsumerState<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends ConsumerState<NicknamePage> {
  late TextEditingController nicknameController;

  @override
  void initState() {
    super.initState();
    final nicknameState = ref.read(nicknameProvider);
    nicknameController = TextEditingController(text: nicknameState.nickname);
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nicknameState = ref.watch(nicknameProvider);
    final nicknameNotifier = ref.read(nicknameProvider.notifier);

    ref.listen<NicknameState>(nicknameProvider, (previous, next) {
      if (next.nickname != nicknameController.text) {
        nicknameController.text = next.nickname;
      }
    });

    return Stack(
      children: [
        const PartialImageBackground(
          startFraction: 0.25,
          endFraction: 0.5,
        ),
        CustomPage(
          progressPercentage: 50.0,
          leadingIcon: IconName.backIcon(
            color: ColorName.silver,
          ),
          onLeadingPressed: () {
            AppRouter.router.go(RoutePath.birthday);
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Choose your\nNickname",
                style: TextStyle(
                  color: ColorName.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 58),
              NicknameInputField(
                label: "Nickname",
                width: 343,
                maxLength: 20,
                isValid: nicknameState.isValid,
                controller: nicknameController,
                onChanged: (value) {
                  nicknameNotifier.setNickname(value);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
          showFab: true,
          onFabPressed: (nicknameState.isValid && !nicknameState.isLoading)
              ? () {
                  nicknameNotifier.saveNickname().then((_) {
                    AppRouter.router.go(RoutePath.gender);
                  });
                }
              : null,
          fabChild: nicknameState.isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ColorName.white),
                  strokeWidth: 2,
                )
              : IconName.forwardIcon(
                  color: ColorName.black,
                ),
        ),
      ],
    );
  }
}
