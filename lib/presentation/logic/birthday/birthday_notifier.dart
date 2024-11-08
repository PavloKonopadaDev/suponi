import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/data/models/user_model.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'birthday_state.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:hive/hive.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_progress_event_for_toast.dart';
import 'package:flutter/foundation.dart';

final birthdayProvider = StateNotifierProvider<BirthdayNotifier, BirthdayState>(
  (ref) {
    final localDataSource = getIt<LocalDataSource>();
    final userBox = Hive.box<User>('users');
    final eventBus = getIt<EventBus>();
    return BirthdayNotifier(localDataSource, userBox, eventBus);
  },
);

class BirthdayNotifier extends StateNotifier<BirthdayState> {
  BirthdayNotifier(this.localDataSource, this.userBox, this.eventBus)
      : super(const BirthdayState()) {
    _initializeFields();
  }

  final LocalDataSource localDataSource;
  final Box<User> userBox;
  final EventBus eventBus;

  void _initializeFields() {
    final user = userBox.get('currentUser');
    if (user != null) {
      final birthdayParts = user.birthday.split('/');
      final day = birthdayParts.length > 0 ? birthdayParts[0] : '';
      final month = birthdayParts.length > 1 ? birthdayParts[1] : '';
      final year = birthdayParts.length > 2 ? birthdayParts[2] : '';

      state = state.copyWith(day: day, month: month, year: year);
    } else {
      state = state.copyWith(day: '', month: '', year: '');
    }
    validate();
  }

  void setDay(String value) {
    state = state.copyWith(day: value);
    validate();
    localDataSource.saveDay(value);
  }

  void setMonth(String value) {
    state = state.copyWith(month: value);
    validate();
    localDataSource.saveMonth(value);
  }

  void setYear(String value) {
    state = state.copyWith(year: value);
    validate();
    localDataSource.saveYear(value);
  }

  void validate() {
    bool dayValid = true;
    bool monthValid = true;
    bool yearValid = true;

    if (state.day.isNotEmpty) {
      final day = int.tryParse(state.day);
      if (day == null || day < 1 || day > 31) {
        dayValid = false;
      }
    }

    if (state.month.isNotEmpty) {
      final month = int.tryParse(state.month);
      if (month == null || month < 1 || month > 12) {
        monthValid = false;
      }
    }

    if (state.year.isNotEmpty) {
      final year = int.tryParse(state.year);
      final currentYear = DateTime.now().year;
      if (year == null || year < 1900 || year > currentYear) {
        yearValid = false;
      }
    }

    bool isValid = dayValid &&
        monthValid &&
        yearValid &&
        state.day.isNotEmpty &&
        state.month.isNotEmpty &&
        state.year.isNotEmpty;

    state = state.copyWith(
      dayValid: dayValid,
      monthValid: monthValid,
      yearValid: yearValid,
      isValid: isValid,
    );
  }

  Future<void> saveBirthday() async {
    if (!state.isValid) return;

    try {
      state = state.copyWith(isLoading: true);
      eventBus.fire(AppProgressEventForToast());

      final birthday = "${state.day}/${state.month}/${state.year}";

      final user = userBox.get('currentUser');
      if (user != null) {
        final updatedUser = user.copyWith(birthday: birthday);
        await userBox.put('currentUser', updatedUser);
      } else {
        final newUser = User(
          name: '',
          birthday: birthday,
          gender: 'Unspecified',
          photoPath: null,
        );
        await userBox.put('currentUser', newUser);
      }
      state = state.copyWith(isLoading: false);
      AppRouter.router.go(RoutePath.nickname);

      eventBus.fire(AppProgressEventForToast(status: false));
    } catch (e) {
      state = state.copyWith(isLoading: false);
      eventBus.fire(AppProgressEventForToast(status: false));
      debugPrint('Error saving birthday: $e');
    }
  }
}
