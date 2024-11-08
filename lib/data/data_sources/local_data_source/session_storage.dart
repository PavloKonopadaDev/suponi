// lib/data/data_sources/local_data_source/session_storage.dart

import 'package:injectable/injectable.dart';
import 'package:suppose_test_task/data/api/store_api/local_storage_api.dart';
import 'package:suppose_test_task/injector.dart';

@LazySingleton()
class LocalDataSource {
  LocalDataSource() {
    _hiveStoreApi = getIt<LocalStorageApi>();
  }

  late final LocalStorageApi _hiveStoreApi;

  Future<void> openBox() => _hiveStoreApi.openBox();

  bool get isFirstLaunch => _hiveStoreApi.isFirstLaunch;

  Future<void> setFirstLaunch() => _hiveStoreApi.setFirstLaunch();

  Future<void> clearLocalData() {
    return _hiveStoreApi.clearLocalData();
  }

  Future<bool> getIsLogout() async {
    return _hiveStoreApi.getIsLogout();
  }

  Future<void> setCameraAccess({required bool status}) async {
    return await _hiveStoreApi.setCameraAccess(status: status);
  }

  Future<bool?> getCameraAccessStatus() async {
    return _hiveStoreApi.getCameraAccessStatus();
  }

  Future<void> saveCapturedPhotoPath(String path) {
    return _hiveStoreApi.saveCapturedPhotoPath(path);
  }

  String? getCapturedPhotoPath() {
    return _hiveStoreApi.getCapturedPhotoPath();
  }

  Future<void> deleteCapturedPhotoPath() {
    return _hiveStoreApi.deleteCapturedPhotoPath();
  }

  Future<void> saveDay(String day) => _hiveStoreApi.saveDay(day);
  String? getDay() => _hiveStoreApi.getDay();

  Future<void> saveMonth(String month) => _hiveStoreApi.saveMonth(month);
  String? getMonth() => _hiveStoreApi.getMonth();

  Future<void> saveYear(String year) => _hiveStoreApi.saveYear(year);
  String? getYear() => _hiveStoreApi.getYear();

  Future<void> saveUserName(String userName) {
    return _hiveStoreApi.saveUserName(userName);
  }

  String? getUserName() {
    return _hiveStoreApi.getUserName();
  }

  Future<void> setIsUnlocked(bool isUnlocked) async {
    return _hiveStoreApi.setIsUnlocked(isUnlocked);
  }

  bool get isUnlocked => _hiveStoreApi.isUnlocked ?? false;
}
