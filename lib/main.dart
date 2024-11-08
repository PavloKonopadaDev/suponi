import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/data/models/user_model.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:suppose_test_task/presentation/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());

  await configureDependencies();

  await Hive.openBox<User>('users');

  await getIt<LocalDataSource>().openBox();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
