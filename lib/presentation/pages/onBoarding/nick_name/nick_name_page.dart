// lib/presentation/pages/nickname/nickname_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/presentation/logic/nickname/nick_name_notifier.dart';
import 'package:suppose_test_task/presentation/logic/nickname/nickname_state.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/reusable_canvas.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/presentation/widgets/nickname_field.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:hive/hive.dart';
import 'package:suppose_test_task/data/modela/user_model.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_progress_event_for_toast.dart';

final nicknameProvider = StateNotifierProvider<NicknameNotifier, NicknameState>(
  (ref) {
    final localDataSource = getIt<LocalDataSource>();
    final userBox = Hive.box<User>('users');
    final eventBus = getIt<EventBus>();
    return NicknameNotifier(localDataSource, userBox, eventBus);
  },
);

class NicknamePage extends ConsumerWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nicknameState = ref.watch(nicknameProvider);
    final nicknameNotifier = ref.read(nicknameProvider.notifier);

    return CustomPage(
      progressPercentage: 50.0,
      leadingIcon: const Icon(
        Icons.arrow_back,
        color: Color(0xFF959595), // Колір стрілки назад
      ),
      onLeadingPressed: () {
        AppRouter.router.go(RoutePath.birthday);
      },
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Text(
            "Choose a\nNickname",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 58),
          NicknameInputField(
            label: "Nickname",
            width: 343,
            maxLength: 20,
            isValid: nicknameState.isValid,
            onChanged: (value) {
              nicknameNotifier.setNickname(value);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
      showFab: true,
      onFabPressed: (nicknameState.isValid && !nicknameState.isLoading)
          ? () {
              nicknameNotifier.saveNickname().then((_) {
                AppRouter.router.go(RoutePath.gender);
              });
            }
          : null,
      fabChild: nicknameState.isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            )
          : const Icon(Icons.arrow_forward),
    );
  }
}
