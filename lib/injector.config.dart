// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:suppose_test_task/data/api/store_api/local_storage_api.dart'
    as _i141;
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart'
    as _i179;
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart'
    as _i400;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i141.LocalStorageApi>(() => _i141.LocalStorageApi());
    gh.lazySingleton<_i179.LocalDataSource>(() => _i179.LocalDataSource());
    gh.lazySingleton<_i400.EventBus>(() => _i400.EventBus());
    return this;
  }
}
