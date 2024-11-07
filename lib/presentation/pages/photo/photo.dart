// lib/presentation/pages/photo/photo_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/presentation/logic/photo/photo_notifier.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/reusable_canvas.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/photo_selction_button.dart';
import 'package:suppose_test_task/presentation/widgets/photo_info_container.dart';

class PhotoPage extends ConsumerWidget {
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoState = ref.watch(photoProvider);
    final photoNotifier = ref.read(photoProvider.notifier);

    Future<void> _showPermissionDialog() async {
      final shouldProceed = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text(
                  'Camera Access Required',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                content: const Text(
                  'We need access to your camera to take photos.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      photoNotifier.permissionDenied(context);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Allow',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      photoNotifier.pickPhoto(context);
                    },
                  ),
                ],
              );
            },
          ) ??
          false;
    }

    return CustomPage(
      progressPercentage: 100.0,
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
            "Add nice photo\n of yourself",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 50),
          PhotoSelectionButton(
            label: "Take your first photo",
            onTap: _showPermissionDialog,
          ),
          const SizedBox(height: 50),
          const PhotoInfoContainer(),
        ],
      ),
      showFab: false,
    );
  }
}
