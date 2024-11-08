// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_preview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoPreviewState {
  String? get photoPath => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of PhotoPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoPreviewStateCopyWith<PhotoPreviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoPreviewStateCopyWith<$Res> {
  factory $PhotoPreviewStateCopyWith(
          PhotoPreviewState value, $Res Function(PhotoPreviewState) then) =
      _$PhotoPreviewStateCopyWithImpl<$Res, PhotoPreviewState>;
  @useResult
  $Res call({String? photoPath, bool isLoading});
}

/// @nodoc
class _$PhotoPreviewStateCopyWithImpl<$Res, $Val extends PhotoPreviewState>
    implements $PhotoPreviewStateCopyWith<$Res> {
  _$PhotoPreviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoPath = freezed,
    Object? isLoading = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoPreviewStateImplCopyWith<$Res>
    implements $PhotoPreviewStateCopyWith<$Res> {
  factory _$$PhotoPreviewStateImplCopyWith(_$PhotoPreviewStateImpl value,
          $Res Function(_$PhotoPreviewStateImpl) then) =
      __$$PhotoPreviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? photoPath, bool isLoading});
}

/// @nodoc
class __$$PhotoPreviewStateImplCopyWithImpl<$Res>
    extends _$PhotoPreviewStateCopyWithImpl<$Res, _$PhotoPreviewStateImpl>
    implements _$$PhotoPreviewStateImplCopyWith<$Res> {
  __$$PhotoPreviewStateImplCopyWithImpl(_$PhotoPreviewStateImpl _value,
      $Res Function(_$PhotoPreviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoPath = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$PhotoPreviewStateImpl(
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PhotoPreviewStateImpl implements _PhotoPreviewState {
  const _$PhotoPreviewStateImpl({this.photoPath, this.isLoading = false});

  @override
  final String? photoPath;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'PhotoPreviewState(photoPath: $photoPath, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoPreviewStateImpl &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photoPath, isLoading);

  /// Create a copy of PhotoPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoPreviewStateImplCopyWith<_$PhotoPreviewStateImpl> get copyWith =>
      __$$PhotoPreviewStateImplCopyWithImpl<_$PhotoPreviewStateImpl>(
          this, _$identity);
}

abstract class _PhotoPreviewState implements PhotoPreviewState {
  const factory _PhotoPreviewState(
      {final String? photoPath,
      final bool isLoading}) = _$PhotoPreviewStateImpl;

  @override
  String? get photoPath;
  @override
  bool get isLoading;

  /// Create a copy of PhotoPreviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoPreviewStateImplCopyWith<_$PhotoPreviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
