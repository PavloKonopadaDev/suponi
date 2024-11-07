// lib/presentation/logic/photo/photo_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_state.freezed.dart';

@freezed
class PhotoState with _$PhotoState {
  const factory PhotoState({
    String? photoPath,
    @Default(false) bool isLoading,
    @Default(false) bool isSelected,
  }) = _PhotoState;
}
