// lib/presentation/logic/birthday/birthday_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'birthday_state.freezed.dart';

@freezed
class BirthdayState with _$BirthdayState {
  const factory BirthdayState({
    @Default('') String day,
    @Default('') String month,
    @Default('') String year,
    @Default(true) bool dayValid,
    @Default(true) bool monthValid,
    @Default(true) bool yearValid,
    @Default(false) bool isValid,
    @Default(false) bool isLoading,
  }) = _BirthdayState;
}
