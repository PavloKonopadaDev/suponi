import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';

class AppProgressEventForToast extends Event {
  AppProgressEventForToast({this.status = true});

  final bool status;
}
