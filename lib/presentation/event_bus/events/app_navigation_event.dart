import 'package:suppose_test_task/presentation/event_bus/event_bus.dart';

class AppNavigateEvent extends Event {
  final String path;

  AppNavigateEvent(this.path);
}
