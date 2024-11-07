// lib/presentation/logic/nickname/nickname_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/data/modela/user_model.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'nickname_state.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:hive/hive.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_progress_event_for_toast.dart';
import 'package:flutter/foundation.dart';

final nicknameProvider = StateNotifierProvider<NicknameNotifier, NicknameState>(
  (ref) {
    final localDataSource = getIt<LocalDataSource>();
    final userBox = Hive.box<User>('users');
    final eventBus = getIt<EventBus>();
    return NicknameNotifier(localDataSource, userBox, eventBus);
  },
);

class NicknameNotifier extends StateNotifier<NicknameState> {
  NicknameNotifier(this.localDataSource, this.userBox, this.eventBus)
      : super(const NicknameState());

  final LocalDataSource localDataSource;
  final Box<User> userBox;
  final EventBus eventBus;

  void setNickname(String value) {
    state = state.copyWith(nickname: value);
    validate();
  }

  void validate() {
    bool isValid = true;

    if (state.nickname.isNotEmpty) {
      final nicknamePattern = RegExp(r'^[a-zA-Z0-9_ ]+$');
      if (!nicknamePattern.hasMatch(state.nickname) || state.nickname.length < 4) {
        isValid = false;
      }
    } else {
      isValid = false;
    }

    state = state.copyWith(isValid: isValid);
  }

  Future<void> saveNickname() async {
    if (!state.isValid) return;

    try {
      state = state.copyWith(isLoading: true);
      eventBus.fire(AppProgressEventForToast());

      final user = userBox.get('currentUser');
      if (user != null) {
        final updatedUser = user.copyWith(name: state.nickname);
        await userBox.put('currentUser', updatedUser);
      } else {
        final newUser = User(
          name: state.nickname,
          birthday: '01/01/2000',
          gender: 'Unspecified',
          photoPath: null,
        );
        await userBox.put('currentUser', newUser);
      }
      state = state.copyWith(
        nickname: '',
        isValid: false,
      );
      AppRouter.router.go(RoutePath.gender);

      state = state.copyWith(isLoading: false);
      eventBus.fire(AppProgressEventForToast(status: false));
    } catch (e) {
      state = state.copyWith(isLoading: false);
      eventBus.fire(AppProgressEventForToast(status: false));
      debugPrint('Error saving nickname: $e');
    }
  }
}
