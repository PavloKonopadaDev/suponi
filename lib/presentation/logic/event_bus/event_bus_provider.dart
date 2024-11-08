import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_event_for_toast.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_progress_event_for_toast.dart';

final appProgressEventProvider = StreamProvider<AppProgressEventForToast>((ref) {
  return EventBus().on<AppProgressEventForToast>();
});

final appEventForToastProvider = StreamProvider<AppEventForToast>((ref) {
  return EventBus().on<AppEventForToast>();
});
