import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/data/models/user_model.dart';
import 'nickname_state.dart';
import 'package:suppose_test_task/injector.dart';

final nicknameProvider = StateNotifierProvider<NicknameNotifier, NicknameState>(
  (ref) {
    final localDataSource = getIt<LocalDataSource>();
    final userBox = Hive.box<User>('users');

    return NicknameNotifier(localDataSource, userBox);
  },
);

class NicknameNotifier extends StateNotifier<NicknameState> {
  NicknameNotifier(this.localDataSource, this.userBox) : super(const NicknameState()) {
    _initializeNickname();
  }

  final LocalDataSource localDataSource;
  final Box<User> userBox;

  void _initializeNickname() {
    final user = userBox.get('currentUser');
    final nickname = user?.name ?? "";
    // final userName = localDataSource.getUserName() ?? '';
    state = state.copyWith(nickname: nickname);
    validate();
  }

  void setNickname(String value) {
    state = state.copyWith(nickname: value);
    validate();
  }

  void validate() {
    bool isValid = state.nickname.isNotEmpty &&
        state.nickname.length >= 4 &&
        RegExp(r'^[a-zA-Z0-9_ ]+$').hasMatch(state.nickname);
    state = state.copyWith(isValid: isValid);
  }

  Future<void> saveNickname() async {
    if (!state.isValid) return;

    try {
      state = state.copyWith(isLoading: true);

      await localDataSource.saveUserName(state.nickname);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      debugPrint('Error saving nickname: $e');
    }
  }
}
