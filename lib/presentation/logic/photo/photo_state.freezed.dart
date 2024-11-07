// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoState {
  String? get photoPath => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoStateCopyWith<PhotoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoStateCopyWith<$Res> {
  factory $PhotoStateCopyWith(
          PhotoState value, $Res Function(PhotoState) then) =
      _$PhotoStateCopyWithImpl<$Res, PhotoState>;
  @useResult
  $Res call({String? photoPath, bool isLoading, bool isSelected});
}

/// @nodoc
class _$PhotoStateCopyWithImpl<$Res, $Val extends PhotoState>
    implements $PhotoStateCopyWith<$Res> {
  _$PhotoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoPath = freezed,
    Object? isLoading = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoStateImplCopyWith<$Res>
    implements $PhotoStateCopyWith<$Res> {
  factory _$$PhotoStateImplCopyWith(
          _$PhotoStateImpl value, $Res Function(_$PhotoStateImpl) then) =
      __$$PhotoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? photoPath, bool isLoading, bool isSelected});
}

/// @nodoc
class __$$PhotoStateImplCopyWithImpl<$Res>
    extends _$PhotoStateCopyWithImpl<$Res, _$PhotoStateImpl>
    implements _$$PhotoStateImplCopyWith<$Res> {
  __$$PhotoStateImplCopyWithImpl(
      _$PhotoStateImpl _value, $Res Function(_$PhotoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoPath = freezed,
    Object? isLoading = null,
    Object? isSelected = null,
  }) {
    return _then(_$PhotoStateImpl(
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PhotoStateImpl implements _PhotoState {
  const _$PhotoStateImpl(
      {this.photoPath, this.isLoading = false, this.isSelected = false});

  @override
  final String? photoPath;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'PhotoState(photoPath: $photoPath, isLoading: $isLoading, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoStateImpl &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, photoPath, isLoading, isSelected);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoStateImplCopyWith<_$PhotoStateImpl> get copyWith =>
      __$$PhotoStateImplCopyWithImpl<_$PhotoStateImpl>(this, _$identity);
}

abstract class _PhotoState implements PhotoState {
  const factory _PhotoState(
      {final String? photoPath,
      final bool isLoading,
      final bool isSelected}) = _$PhotoStateImpl;

  @override
  String? get photoPath;
  @override
  bool get isLoading;
  @override
  bool get isSelected;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoStateImplCopyWith<_$PhotoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
