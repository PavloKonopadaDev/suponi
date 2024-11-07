// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nickname_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NicknameState {
  String get nickname => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NicknameStateCopyWith<NicknameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NicknameStateCopyWith<$Res> {
  factory $NicknameStateCopyWith(
          NicknameState value, $Res Function(NicknameState) then) =
      _$NicknameStateCopyWithImpl<$Res, NicknameState>;
  @useResult
  $Res call({String nickname, bool isValid, bool isLoading});
}

/// @nodoc
class _$NicknameStateCopyWithImpl<$Res, $Val extends NicknameState>
    implements $NicknameStateCopyWith<$Res> {
  _$NicknameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? isValid = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NicknameStateImplCopyWith<$Res>
    implements $NicknameStateCopyWith<$Res> {
  factory _$$NicknameStateImplCopyWith(
          _$NicknameStateImpl value, $Res Function(_$NicknameStateImpl) then) =
      __$$NicknameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname, bool isValid, bool isLoading});
}

/// @nodoc
class __$$NicknameStateImplCopyWithImpl<$Res>
    extends _$NicknameStateCopyWithImpl<$Res, _$NicknameStateImpl>
    implements _$$NicknameStateImplCopyWith<$Res> {
  __$$NicknameStateImplCopyWithImpl(
      _$NicknameStateImpl _value, $Res Function(_$NicknameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? isValid = null,
    Object? isLoading = null,
  }) {
    return _then(_$NicknameStateImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NicknameStateImpl implements _NicknameState {
  const _$NicknameStateImpl(
      {this.nickname = '', this.isValid = false, this.isLoading = false});

  @override
  @JsonKey()
  final String nickname;
  @override
  @JsonKey()
  final bool isValid;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'NicknameState(nickname: $nickname, isValid: $isValid, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NicknameStateImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nickname, isValid, isLoading);

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NicknameStateImplCopyWith<_$NicknameStateImpl> get copyWith =>
      __$$NicknameStateImplCopyWithImpl<_$NicknameStateImpl>(this, _$identity);
}

abstract class _NicknameState implements NicknameState {
  const factory _NicknameState(
      {final String nickname,
      final bool isValid,
      final bool isLoading}) = _$NicknameStateImpl;

  @override
  String get nickname;
  @override
  bool get isValid;
  @override
  bool get isLoading;

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NicknameStateImplCopyWith<_$NicknameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
