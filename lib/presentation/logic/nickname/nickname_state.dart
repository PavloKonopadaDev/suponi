import 'package:freezed_annotation/freezed_annotation.dart';

part 'nickname_state.freezed.dart';

@freezed
class NicknameState with _$NicknameState {
  const factory NicknameState({
    @Default('') String nickname,
    @Default(false) bool isValid,
    @Default(false) bool isLoading,
  }) = _NicknameState;
}
