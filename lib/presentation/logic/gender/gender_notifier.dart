// lib/presentation/logic/gender/gender_notifier.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/data/modela/user_model.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'gender_state.dart';
import 'package:hive/hive.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_progress_event_for_toast.dart';
import 'package:flutter/foundation.dart';

final genderProvider = StateNotifierProvider<GenderNotifier, GenderState>(
  (ref) {
    final userBox = Hive.box<User>('users');
    final eventBus = getIt<EventBus>();
    return GenderNotifier(userBox, eventBus);
  },
);

class GenderNotifier extends StateNotifier<GenderState> {
  GenderNotifier(this.userBox, this.eventBus) : super(const GenderState());

  final Box<User> userBox;
  final EventBus eventBus;

  void selectGender(String gender) {
    state = state.copyWith(selectedGender: gender);
  }

  Future<void> saveGender() async {
    if (state.selectedGender == null) return;

    try {
      state = state.copyWith(isLoading: true);
      eventBus.fire(AppProgressEventForToast());

      final user = userBox.get('currentUser');
      if (user != null) {
        final updatedUser = user.copyWith(gender: state.selectedGender ?? "");
        await userBox.put('currentUser', updatedUser);
      } else {
        final newUser = User(
          name: 'Default Name',
          birthday: '01/01/2000',
          gender: state.selectedGender ?? "",
          photoPath: null,
        );
        await userBox.put('currentUser', newUser);
      }

      state = state.copyWith(isLoading: false);
      eventBus.fire(AppProgressEventForToast(status: false));

      AppRouter.router.go(RoutePath.photo);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      eventBus.fire(AppProgressEventForToast(status: false));
      debugPrint('Error saving gender: $e');
    }
  }
}
