import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_progress_event_for_toast.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/presentation/logic/onboarding/onboarding_state.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:suppose_test_task/injector.dart';

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, OnboardingState>(
  (ref) {
    final localDataSource = getIt<LocalDataSource>();
    final eventBus = getIt<EventBus>();
    return OnboardingNotifier(localDataSource, eventBus);
  },
);

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier(this.localDataSource, this.eventBus) : super(const OnboardingState());

  final LocalDataSource localDataSource;
  final EventBus eventBus;

  Future<void> continueOnboarding() async {
    try {
      AppRouter.router.go(RoutePath.birthday);
    } catch (e) {
      state = state.copyWith(hasLoading: false, hasError: true);
      eventBus.fire(AppProgressEventForToast(status: false));
    }
  }
}
