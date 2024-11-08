import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/generated/assets/colors.gen.dart';
import 'package:suppose_test_task/presentation/logic/take_photo/take_photo_notifier.dart';
import 'package:suppose_test_task/presentation/resources/icons.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/circle_top_button.dart';

class TakePhotoPage extends ConsumerWidget {
  const TakePhotoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final takePhotoState = ref.watch(takePhotoProvider);
    final takePhotoNotifier = ref.read(takePhotoProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CircleTopButton(
          onTap: () => AppRouter.router.go(RoutePath.photo),
          iconInsideCircle: IconName.backIcon(
            color: ColorName.lightWhite,
          ),
        ),
        actions: [
          CircleTopButton(
            onTap: () => takePhotoNotifier.switchCamera(),
            iconInsideCircle: IconName.revertCameraIcon(),
          ),
        ],
      ),
      body: Stack(
        children: [
          if (takePhotoState.cameraController != null &&
              takePhotoState.cameraController!.value.isInitialized)
            SizedBox.expand(
              child: CameraPreview(takePhotoState.cameraController!),
            )
          else if (takePhotoState.isLoading)
            const Center(child: CircularProgressIndicator()),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: takePhotoNotifier.capturePhoto,
                child: Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    color: ColorName.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        color: ColorName.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: takePhotoState.hasSavedPhoto
          ? CircleTopButton(
              onTap: () => AppRouter.router.go(RoutePath.photoPreview),
              iconInsideCircle: IconName.forwardIcon(),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
