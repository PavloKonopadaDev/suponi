import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camera/camera.dart';

part 'take_photo_state.freezed.dart';

@freezed
class TakePhotoState with _$TakePhotoState {
  const factory TakePhotoState({
    CameraController? cameraController,
    List<CameraDescription>? cameras,
    @Default(true) bool isRearCameraSelected,
    XFile? capturedPhoto,
    @Default(false) bool isLoading,
    @Default(false) bool hasSavedPhoto,
  }) = _TakePhotoState;
}
