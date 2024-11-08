// lib/data/api/store_api/local_storage_api.dart

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalStorageApi {
  static const _hiveBox = 'hive_box';
  static const _userId = 'user_id';

  static const _firstLaunch = 'first_launch';
  static const _userName = 'user_name';
  static const _isLogout = 'is_logout';
  static const _isCameraAccess = 'camera_access';
  static const _capturedPhotoPath = 'captured_photo_path';
  static const _dayKey = 'user_day';
  static const _monthKey = 'user_month';
  static const _yearKey = 'user_year';
  static const _isUnlockedKey = 'is_unlocked';

  late final Box _box;

  String? get currentUserId => _box.get(_userId);

  String _userSpecificKey(String key) => '$key $currentUserId';

  Future<void> openBox() async {
    try {
      _box = await Hive.openBox(_hiveBox);
    } catch (_) {
      await Hive.deleteBoxFromDisk(_hiveBox);
      _box = await Hive.openBox(_hiveBox);
    }
  }

  Future<void> setFirstLaunch() async {
    await _box.put(_userSpecificKey(_firstLaunch), false);
  }

  bool get isFirstLaunch {
    try {
      return _box.get(_userSpecificKey(_firstLaunch), defaultValue: true);
    } catch (_) {
      _box.delete(_userSpecificKey(_firstLaunch));
      return true;
    }
  }

  Future<void> clearLocalData() async {
    await _box.clear();
  }

  Future<bool> getIsLogout() async {
    final recentSearch = _box.get(_isLogout);
    return recentSearch ?? false;
  }

  Future<void> setCameraAccess({required bool status}) async {
    await _box.put(_isCameraAccess, status);
  }

  Future<bool?> getCameraAccessStatus() async {
    final bool? cameraAccessStatus = _box.get(_isCameraAccess);
    return cameraAccessStatus;
  }

  Future<void> saveCapturedPhotoPath(String path) async {
    await _box.put(_userSpecificKey(_capturedPhotoPath), path);
  }

  String? getCapturedPhotoPath() {
    return _box.get(_userSpecificKey(_capturedPhotoPath));
  }

  Future<void> deleteCapturedPhotoPath() async {
    await _box.delete(_capturedPhotoPath);
  }

  Future<void> saveDay(String day) async {
    await _box.put(_userSpecificKey(_dayKey), day);
  }

  String? getDay() {
    return _box.get(_userSpecificKey(_dayKey), defaultValue: '');
  }

  Future<void> saveMonth(String month) async {
    await _box.put(_userSpecificKey(_monthKey), month);
  }

  String? getMonth() {
    return _box.get(_userSpecificKey(_monthKey), defaultValue: '');
  }

  Future<void> saveYear(String year) async {
    await _box.put(_userSpecificKey(_yearKey), year);
  }

  String? getYear() {
    return _box.get(_userSpecificKey(_yearKey), defaultValue: '');
  }

  Future<void> saveUserName(String userName) async {
    await _box.put(_userName, userName);
  }

  String? getUserName() {
    return _box.get(_userName, defaultValue: '');
  }

  Future<void> setIsUnlocked(bool isUnlocked) async {
    await _box.put(_isUnlockedKey, isUnlocked);
  }

  bool get isUnlocked {
    return _box.get(_isUnlockedKey, defaultValue: false);
  }
}
