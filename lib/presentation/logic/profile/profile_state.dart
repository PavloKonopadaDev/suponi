import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default('') String userName,
    @Default('') String birthday,
    @Default(false) bool isUnlocked,
  }) = _ProfileState;
}
