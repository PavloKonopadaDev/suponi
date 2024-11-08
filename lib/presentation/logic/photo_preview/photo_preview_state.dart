import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_preview_state.freezed.dart';

@freezed
class PhotoPreviewState with _$PhotoPreviewState {
  const factory PhotoPreviewState({
    String? photoPath,
    @Default(false) bool isLoading,
  }) = _PhotoPreviewState;
}
