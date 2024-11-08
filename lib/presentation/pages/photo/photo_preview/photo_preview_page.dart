import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';
import 'package:suppose_test_task/presentation/logic/photo_preview/photo_preview_notifier.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/circle_top_button.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/injector.dart';

class PhotoPreviewPage extends ConsumerStatefulWidget {
  const PhotoPreviewPage({super.key});

  @override
  _PhotoPreviewPageState createState() => _PhotoPreviewPageState();
}

class _PhotoPreviewPageState extends ConsumerState<PhotoPreviewPage> {
  bool _isBannerVisible = true;

  @override
  Widget build(BuildContext context) {
    final photoPreviewState = ref.watch(photoPreviewProvider);
    final localDataSource = getIt<LocalDataSource>();

    final showBanner = !localDataSource.isUnlocked && _isBannerVisible;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CircleTopButton(
          onTap: () => AppRouter.router.go(RoutePath.takePhoto),
          iconInsideCircle: IconName.backIcon(
            color: ColorName.lightWhite,
          ),
        ),
        actions: [
          CircleTopButton(
            onTap: () => AppRouter.router.go(RoutePath.profile),
            iconInsideCircle: IconName.gearIcon(
              color: ColorName.lightWhite,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          if (photoPreviewState.photoPath != null)
            Positioned.fill(
              child: Image.file(
                File(photoPreviewState.photoPath!),
                fit: BoxFit.cover,
              ),
            )
          else if (photoPreviewState.isLoading)
            const Center(child: CircularProgressIndicator())
          else
            const Center(child: Text('Photo is not found')),
          if (showBanner)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add imitation baner.",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _isBannerVisible = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
