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
}
