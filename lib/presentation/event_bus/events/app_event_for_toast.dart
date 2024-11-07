import 'package:suppose_test_task/presentation/enums/app_toast_message.dart';
import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';

class AppEventForToast extends Event {
  final AppToastMessage appToastMessage;
  final String? tempMessage;

  const AppEventForToast({
    required this.appToastMessage,
    this.tempMessage,
  });
}
