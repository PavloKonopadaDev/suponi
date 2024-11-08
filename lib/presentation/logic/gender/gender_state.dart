import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender_state.freezed.dart';

@freezed
class GenderState with _$GenderState {
  const factory GenderState({
    String? selectedGender,
    @Default(false) bool isLoading,
  }) = _GenderState;
}
