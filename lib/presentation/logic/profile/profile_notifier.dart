import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/data/models/user_model.dart';
import 'package:suppose_test_task/injector.dart';
import 'profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final userBox = Hive.box<User>('users');
  return ProfileNotifier(userBox);
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(
    this.userBox,
  ) : super(const ProfileState()) {
    loadUserProfile();
  }

  final localDataSource = getIt<LocalDataSource>();

  Future<void> loadUserProfile() async {
    final userName = localDataSource.getUserName() ?? '';
    final birthday =
        "${localDataSource.getDay()}/${localDataSource.getMonth()}/${localDataSource.getYear()}";
    final isUnlocked = localDataSource.isUnlocked ?? false;
    state = state.copyWith(userName: userName, birthday: birthday, isUnlocked: isUnlocked);
  }

  Future<void> unlockApp() async {
    await localDataSource.setIsUnlocked(true);
    state = state.copyWith(isUnlocked: true);
  }

  final Box<User> userBox;
}
