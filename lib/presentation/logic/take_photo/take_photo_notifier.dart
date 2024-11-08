import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:suppose_test_task/presentation/logic/photo_preview/photo_preview_notifier.dart';
import 'package:suppose_test_task/presentation/logic/take_photo/take_photo_state.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';

final takePhotoProvider = StateNotifierProvider<TakePhotoNotifier, TakePhotoState>(
  (ref) => TakePhotoNotifier(ref),
);

class TakePhotoNotifier extends StateNotifier<TakePhotoState> {
  TakePhotoNotifier(this.ref) : super(const TakePhotoState()) {
    initializeCamera();
    _localDataSource = getIt<LocalDataSource>();
    _checkExistingPhoto();
  }
  final Ref ref;

  late final LocalDataSource _localDataSource;

  Future<void> initializeCamera() async {
    state = state.copyWith(isLoading: true);

    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        final cameraController = CameraController(
          cameras[0],
          ResolutionPreset.high,
        );

        await cameraController.initialize();
        state = state.copyWith(
          cameraController: cameraController,
          cameras: cameras,
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      debugPrint('Error initializing camera: $e');
    }
  }

  void switchCamera() {
    final isRearCameraSelected = state.isRearCameraSelected;
    final newCamera = isRearCameraSelected ? state.cameras![1] : state.cameras![0];
    final cameraController = CameraController(
      newCamera,
      ResolutionPreset.high,
    );

    cameraController.initialize().then((_) {
      state = state.copyWith(
        cameraController: cameraController,
        isRearCameraSelected: !isRearCameraSelected,
      );
    });
  }

  Future<void> _checkExistingPhoto() async {
    final photoPath = _localDataSource.getCapturedPhotoPath();
    state = state.copyWith(hasSavedPhoto: photoPath != null);
  }

  Future<void> capturePhoto() async {
    if (state.cameraController != null && state.cameraController!.value.isInitialized) {
      final capturedPhoto = await state.cameraController!.takePicture();

      await _localDataSource.deleteCapturedPhotoPath();
      await _localDataSource.saveCapturedPhotoPath(capturedPhoto.path);

      state = state.copyWith(capturedPhoto: capturedPhoto, hasSavedPhoto: true);

      ref.read(photoPreviewProvider.notifier).loadPhoto();
      getIt<LocalDataSource>().setFirstLaunch();

      AppRouter.router.go(RoutePath.photoPreview);
    }
  }

  @override
  void dispose() {
    state.cameraController?.dispose();
    super.dispose();
  }
}
