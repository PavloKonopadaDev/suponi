// lib/data/api/store_api/local_storage_api.dart

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalStorageApi {
  static const _hiveBox = 'hive_box';
  static const _userId = 'user_id';

  static const _firstLaunch = 'first_launch';
  static const _userName = 'user_name';
  static const _userBirthday = 'user_birthday';
  static const _showAdd = 'show_add';
  static const _isLogout = 'is_logout';
  static const _isCameraAccess = 'camera_access';

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
    await _box.put(_isLogout, true);
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
}
