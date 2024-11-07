// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gender_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenderState {
  String? get selectedGender => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of GenderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenderStateCopyWith<GenderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderStateCopyWith<$Res> {
  factory $GenderStateCopyWith(
          GenderState value, $Res Function(GenderState) then) =
      _$GenderStateCopyWithImpl<$Res, GenderState>;
  @useResult
  $Res call({String? selectedGender, bool isLoading});
}

/// @nodoc
class _$GenderStateCopyWithImpl<$Res, $Val extends GenderState>
    implements $GenderStateCopyWith<$Res> {
  _$GenderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedGender = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      selectedGender: freezed == selectedGender
          ? _value.selectedGender
          : selectedGender // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenderStateImplCopyWith<$Res>
    implements $GenderStateCopyWith<$Res> {
  factory _$$GenderStateImplCopyWith(
          _$GenderStateImpl value, $Res Function(_$GenderStateImpl) then) =
      __$$GenderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? selectedGender, bool isLoading});
}

/// @nodoc
class __$$GenderStateImplCopyWithImpl<$Res>
    extends _$GenderStateCopyWithImpl<$Res, _$GenderStateImpl>
    implements _$$GenderStateImplCopyWith<$Res> {
  __$$GenderStateImplCopyWithImpl(
      _$GenderStateImpl _value, $Res Function(_$GenderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedGender = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$GenderStateImpl(
      selectedGender: freezed == selectedGender
          ? _value.selectedGender
          : selectedGender // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GenderStateImpl implements _GenderState {
  const _$GenderStateImpl({this.selectedGender, this.isLoading = false});

  @override
  final String? selectedGender;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'GenderState(selectedGender: $selectedGender, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderStateImpl &&
            (identical(other.selectedGender, selectedGender) ||
                other.selectedGender == selectedGender) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedGender, isLoading);

  /// Create a copy of GenderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderStateImplCopyWith<_$GenderStateImpl> get copyWith =>
      __$$GenderStateImplCopyWithImpl<_$GenderStateImpl>(this, _$identity);
}

abstract class _GenderState implements GenderState {
  const factory _GenderState(
      {final String? selectedGender, final bool isLoading}) = _$GenderStateImpl;

  @override
  String? get selectedGender;
  @override
  bool get isLoading;

  /// Create a copy of GenderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenderStateImplCopyWith<_$GenderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
