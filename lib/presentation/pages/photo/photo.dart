import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/reusable_canvas.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/divided_background_image.dart';
import 'package:suppose_test_task/presentation/widgets/photo_selction_button.dart';
import 'package:suppose_test_task/presentation/widgets/photo_info_container.dart';

class PhotoPage extends ConsumerWidget {
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final photoState = ref.watch(photoProvider);
    // final photoNotifier = ref.read(photoProvider.notifier);

    return Stack(
      children: [
        const PartialImageBackground(
          startFraction: 0.75,
          endFraction: 1.0,
        ),
        CustomPage(
          progressPercentage: 100.0,
          leadingIcon: IconName.backIcon(
            color: ColorName.silver,
          ),
          onLeadingPressed: () {
            AppRouter.router.go(RoutePath.gender);
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Add nice photo\n of yourself",
                style: TextStyle(
                  color: ColorName.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 50),
              PhotoSelectionButton(
                label: "Take your first photo",
                onTap: () {
                  AppRouter.router.go(RoutePath.takePhoto);
                },
              ),
              const SizedBox(height: 50),
              const PhotoInfoContainer(),
            ],
          ),
          showFab: false,
        ),
      ],
    );
  }
}
