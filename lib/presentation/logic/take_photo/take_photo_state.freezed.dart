// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'take_photo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TakePhotoState {
  CameraController? get cameraController => throw _privateConstructorUsedError;
  List<CameraDescription>? get cameras => throw _privateConstructorUsedError;
  bool get isRearCameraSelected => throw _privateConstructorUsedError;
  XFile? get capturedPhoto => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasSavedPhoto => throw _privateConstructorUsedError;

  /// Create a copy of TakePhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TakePhotoStateCopyWith<TakePhotoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TakePhotoStateCopyWith<$Res> {
  factory $TakePhotoStateCopyWith(
          TakePhotoState value, $Res Function(TakePhotoState) then) =
      _$TakePhotoStateCopyWithImpl<$Res, TakePhotoState>;
  @useResult
  $Res call(
      {CameraController? cameraController,
      List<CameraDescription>? cameras,
      bool isRearCameraSelected,
      XFile? capturedPhoto,
      bool isLoading,
      bool hasSavedPhoto});
}

/// @nodoc
class _$TakePhotoStateCopyWithImpl<$Res, $Val extends TakePhotoState>
    implements $TakePhotoStateCopyWith<$Res> {
  _$TakePhotoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TakePhotoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraController = freezed,
    Object? cameras = freezed,
    Object? isRearCameraSelected = null,
    Object? capturedPhoto = freezed,
    Object? isLoading = null,
    Object? hasSavedPhoto = null,
  }) {
    return _then(_value.copyWith(
      cameraController: freezed == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      cameras: freezed == cameras
          ? _value.cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>?,
      isRearCameraSelected: null == isRearCameraSelected
          ? _value.isRearCameraSelected
          : isRearCameraSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      capturedPhoto: freezed == capturedPhoto
          ? _value.capturedPhoto
          : capturedPhoto // ignore: cast_nullable_to_non_nullable
              as XFile?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSavedPhoto: null == hasSavedPhoto
          ? _value.hasSavedPhoto
          : hasSavedPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TakePhotoStateImplCopyWith<$Res>
    implements $TakePhotoStateCopyWith<$Res> {
  factory _$$TakePhotoStateImplCopyWith(_$TakePhotoStateImpl value,
          $Res Function(_$TakePhotoStateImpl) then) =
      __$$TakePhotoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CameraController? cameraController,
      List<CameraDescription>? cameras,
      bool isRearCameraSelected,
      XFile? capturedPhoto,
      bool isLoading,
      bool hasSavedPhoto});
}

/// @nodoc
class __$$TakePhotoStateImplCopyWithImpl<$Res>
    extends _$TakePhotoStateCopyWithImpl<$Res, _$TakePhotoStateImpl>
    implements _$$TakePhotoStateImplCopyWith<$Res> {
  __$$TakePhotoStateImplCopyWithImpl(
      _$TakePhotoStateImpl _value, $Res Function(_$TakePhotoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TakePhotoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraController = freezed,
    Object? cameras = freezed,
    Object? isRearCameraSelected = null,
    Object? capturedPhoto = freezed,
    Object? isLoading = null,
    Object? hasSavedPhoto = null,
  }) {
    return _then(_$TakePhotoStateImpl(
      cameraController: freezed == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      cameras: freezed == cameras
          ? _value._cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>?,
      isRearCameraSelected: null == isRearCameraSelected
          ? _value.isRearCameraSelected
          : isRearCameraSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      capturedPhoto: freezed == capturedPhoto
          ? _value.capturedPhoto
          : capturedPhoto // ignore: cast_nullable_to_non_nullable
              as XFile?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSavedPhoto: null == hasSavedPhoto
          ? _value.hasSavedPhoto
          : hasSavedPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TakePhotoStateImpl implements _TakePhotoState {
  const _$TakePhotoStateImpl(
      {this.cameraController,
      final List<CameraDescription>? cameras,
      this.isRearCameraSelected = true,
      this.capturedPhoto,
      this.isLoading = false,
      this.hasSavedPhoto = false})
      : _cameras = cameras;

  @override
  final CameraController? cameraController;
  final List<CameraDescription>? _cameras;
  @override
  List<CameraDescription>? get cameras {
    final value = _cameras;
    if (value == null) return null;
    if (_cameras is EqualUnmodifiableListView) return _cameras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isRearCameraSelected;
  @override
  final XFile? capturedPhoto;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasSavedPhoto;

  @override
  String toString() {
    return 'TakePhotoState(cameraController: $cameraController, cameras: $cameras, isRearCameraSelected: $isRearCameraSelected, capturedPhoto: $capturedPhoto, isLoading: $isLoading, hasSavedPhoto: $hasSavedPhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TakePhotoStateImpl &&
            (identical(other.cameraController, cameraController) ||
                other.cameraController == cameraController) &&
            const DeepCollectionEquality().equals(other._cameras, _cameras) &&
            (identical(other.isRearCameraSelected, isRearCameraSelected) ||
                other.isRearCameraSelected == isRearCameraSelected) &&
            (identical(other.capturedPhoto, capturedPhoto) ||
                other.capturedPhoto == capturedPhoto) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasSavedPhoto, hasSavedPhoto) ||
                other.hasSavedPhoto == hasSavedPhoto));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cameraController,
      const DeepCollectionEquality().hash(_cameras),
      isRearCameraSelected,
      capturedPhoto,
      isLoading,
      hasSavedPhoto);

  /// Create a copy of TakePhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TakePhotoStateImplCopyWith<_$TakePhotoStateImpl> get copyWith =>
      __$$TakePhotoStateImplCopyWithImpl<_$TakePhotoStateImpl>(
          this, _$identity);
}

abstract class _TakePhotoState implements TakePhotoState {
  const factory _TakePhotoState(
      {final CameraController? cameraController,
      final List<CameraDescription>? cameras,
      final bool isRearCameraSelected,
      final XFile? capturedPhoto,
      final bool isLoading,
      final bool hasSavedPhoto}) = _$TakePhotoStateImpl;

  @override
  CameraController? get cameraController;
  @override
  List<CameraDescription>? get cameras;
  @override
  bool get isRearCameraSelected;
  @override
  XFile? get capturedPhoto;
  @override
  bool get isLoading;
  @override
  bool get hasSavedPhoto;

  /// Create a copy of TakePhotoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TakePhotoStateImplCopyWith<_$TakePhotoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
